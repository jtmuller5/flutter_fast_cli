//
//  CommonFunctionality.swift
//  PurchasesHybridCommon
//
//  Created by Andrés Boedo on 4/19/22.
//  Copyright © 2022 RevenueCat. All rights reserved.
//

import Foundation
import StoreKit
import RevenueCat


@objc(RCCommonFunctionality) public class CommonFunctionality: NSObject {

    typealias InstanceType = PurchasesType & PurchasesSwiftType

    static var sharedInstance: InstanceType {
        get {
            guard let purchases = Self._sharedInstance else {
                fatalError("Purchases has not been configured. Please configure the SDK before calling this method")
            }

            return purchases
        }
        set {
            Self._sharedInstance = newValue
        }
    }

    private static var _sharedInstance: InstanceType?

    // MARK: properties and configuration

    @objc public static var simulatesAskToBuyInSandbox: Bool = false
    @objc public static var appUserID: String { Self.sharedInstance.appUserID }
    @objc public static var isAnonymous: Bool { Self.sharedInstance.isAnonymous }

    @objc public static var proxyURLString: String? {
        get { Purchases.proxyURL?.absoluteString }
        set {
            if let value = newValue {
                guard let proxyURL = URL(string: value) else {
                    fatalError("could not set the proxyURL, provided value is not a valid URL: \(value)")
                }
                Purchases.proxyURL = proxyURL
            } else {
                Purchases.proxyURL = nil
            }
        }
    }

    @objc public var simulatesAskToBuyInSandbox: Bool {
        get {
            // all other platforms already support this feature
            if #available(macOS 10.14, *) {
                return Purchases.simulatesAskToBuyInSandbox
            } else {
                return false
            }
        }
        set {
            // all other platforms already support this feature
            if #available(macOS 10.14, *) {
                Purchases.simulatesAskToBuyInSandbox = newValue
            } else {
                NSLog("called setSimulatesAskToBuyInSandbox, but it's not available on this platform / OS version")
            }
        }
    }

    private static var promoOffersByTimestamp: [String: PromotionalOffer] = [:]

    @available(*, deprecated, message: "Use the set<NetworkId> functions instead")
    @objc public static func setAllowSharingStoreAccount(_ allowSharingStoreAccount: Bool) {
        Self.sharedInstance.allowSharingAppStoreAccount = allowSharingStoreAccount
    }

    @available(*, deprecated, message: "Use setLogLevel instead")
    @objc public static func setDebugLogsEnabled(_ enabled: Bool) {
        Purchases.logLevel = enabled ? .debug : .info
    }

    @objc public static func setLogLevel(_ level: String) {
        guard let level = LogLevel.levelsByDescription[level] else {
            NSLog("Unrecognized log level '\(level)'")
            return
        }

        Purchases.logLevel = level
    }

    /**
     * Sets a log handler and forwards all logs to completion function.
     *
     * - Parameter onLogReceived: Gets a map with two keys: `logLevel` (``LogLevel``  name uppercased), and `message` (the log message)
     */
    @objc public static func setLogHander(onLogReceived: @escaping ([String: String]) -> Void) {
        Purchases.logHandler = { logLevel, message in
            let logDetails = [
                "logLevel": logLevel.description,
                "message": message
            ]
            onLogReceived(logDetails)
        }
    }

    @available(*, deprecated, message: "Use enableAdServicesAttributionTokenCollection() instead")
    @objc public static func setAutomaticAppleSearchAdsAttributionCollection(_ enabled: Bool) {
        Purchases.automaticAppleSearchAdsAttributionCollection = enabled
    }

    @available(iOS 14.3, macOS 11.1, macCatalyst 14.3, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @objc public static func enableAdServicesAttributionTokenCollection() {
        Self.sharedInstance.attribution.enableAdServicesAttributionTokenCollection()
    }

    @objc public static func setFinishTransactions(_ finishTransactions: Bool) {
        Self.sharedInstance.finishTransactions = finishTransactions
    }

    @objc public static func invalidateCustomerInfoCache() {
        Self.sharedInstance.invalidateCustomerInfoCache()
    }

#if os(iOS)
    @available(iOS 14.0, *)
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(macCatalyst, unavailable)
    @objc public static func presentCodeRedemptionSheet() {
        Self.sharedInstance.presentCodeRedemptionSheet()
    }
#endif

    @objc public static func canMakePaymentsWithFeatures(_ features: [Int]) -> Bool {
        // Features are for Google Play only, so we ignore them for iOS.
        // See https://sdk.revenuecat.com/android/5.1.1/purchases/com.revenuecat.purchases/-purchases/-companion/can-make-payments.html
        return Purchases.canMakePayments()
    }
}

// MARK: Refund request
@objc public extension CommonFunctionality {

#if os(iOS)
    @available(iOS 15.0, *)
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @objc(beginRefundRequestProductId:completionBlock:)
    static func beginRefundRequest(productId: String,
                                   completion: @escaping (ErrorContainer?) -> Void) {
        Self.sharedInstance.beginRefundRequest(forProduct: productId) { result in
            Self.processRefundRequestResultWithCompletion(refundRequestResult: result, completion: completion)
        }
    }

    @available(iOS 15.0, *)
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @objc(beginRefundRequestEntitlementId:completionBlock:)
    static func beginRefundRequest(entitlementId: String,
                                   completion: @escaping (ErrorContainer?) -> Void) {
        Self.sharedInstance.beginRefundRequest(forEntitlement: entitlementId) { result in
            Self.processRefundRequestResultWithCompletion(refundRequestResult: result, completion: completion)
        }
    }

    @available(iOS 15.0, *)
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @objc(beginRefundRequestForActiveEntitlementCompletion:)
    static func beginRefundRequestForActiveEntitlement(completion: @escaping (ErrorContainer?) -> Void) {
        Self.sharedInstance.beginRefundRequestForActiveEntitlement { result in
            Self.processRefundRequestResultWithCompletion(refundRequestResult: result, completion: completion)
        }
    }
#endif

}

// MARK: purchasing and restoring
@objc public extension CommonFunctionality {

    @objc(restorePurchasesWithCompletionBlock:)
    static func restorePurchases(completion: @escaping ([String: Any]?, ErrorContainer?) -> Void) {
        let customerInfoCompletion = customerInfoCompletionBlock(from: completion)
        Self.sharedInstance.restorePurchases(completion: customerInfoCompletion)
    }

    @objc(syncPurchasesWithCompletionBlock:)
    static func syncPurchases(completion: (([String: Any]?, ErrorContainer?) -> Void)?) {
        if let completion = completion {
            let customerInfoCompletion = customerInfoCompletionBlock(from: completion)
            Self.sharedInstance.syncPurchases(completion: customerInfoCompletion)
        } else {
            Self.sharedInstance.syncPurchases(completion: nil)
        }
    }

    @objc(purchaseProduct:signedDiscountTimestamp:completionBlock:)
    static func purchase(product productIdentifier: String,
                         signedDiscountTimestamp: String?,
                         completion: @escaping ([String: Any]?, ErrorContainer?) -> Void) {
        let hybridCompletion: @Sendable (StoreTransaction?,
                                         CustomerInfo?,
                                         Error?,
                                         Bool) -> Void = { transaction, customerInfo, error, userCancelled in
            if let error = error {
                completion(nil, Self.createErrorContainer(error: error, userCancelled: userCancelled))
            } else if let customerInfo = customerInfo,
                      let transaction = transaction {
                completion([
                    "customerInfo": customerInfo.dictionary,
                    "productIdentifier": transaction.productIdentifier
                ], nil)
            } else {
                completion(nil, ErrorContainer(error: ErrorCode.unknownError as NSError, extraPayload: [:]))
            }
        }

        self.product(with: productIdentifier) { storeProduct in
            guard let storeProduct = storeProduct else {
                completion(nil, productNotFoundError(description: "Couldn't find product.", userCancelled: false))
                return
            }

            if let signedDiscountTimestamp = signedDiscountTimestamp {
                if #available(iOS 12.2, macOS 10.14.4, tvOS 12.2, *) {
                    guard let promotionalOffer = self.promoOffersByTimestamp[signedDiscountTimestamp] else {
                        completion(nil, productNotFoundError(description: "Couldn't find discount.", userCancelled: false))
                        return
                    }
                    Self.sharedInstance.purchase(product: storeProduct,
                                              promotionalOffer: promotionalOffer,
                                              completion: hybridCompletion)
                    return
                }

            }

            Self.sharedInstance.purchase(product: storeProduct, completion: hybridCompletion)
        }
    }

    @objc(purchasePackage:offering:signedDiscountTimestamp:completionBlock:)
    static func purchase(package packageIdentifier: String,
                         offeringIdentifier: String,
                         signedDiscountTimestamp: String?,
                         completion: @escaping ([String: Any]?, ErrorContainer?) -> Void) {
        let hybridCompletion: @Sendable (StoreTransaction?,
                                         CustomerInfo?,
                                         Error?,
                                         Bool) -> Void = { transaction, customerInfo, error, userCancelled in
            if let error = error {
                completion(nil, Self.createErrorContainer(error: error, userCancelled: userCancelled))
            } else if let customerInfo = customerInfo,
                      let transaction = transaction {
                completion([
                    "customerInfo": customerInfo.dictionary,
                    "productIdentifier": transaction.productIdentifier
                ], nil)
            } else {
                let error = ErrorCode.unknownError as NSError
                completion(nil, ErrorContainer(error: error, extraPayload: [:]))
            }
        }

        package(withIdentifier: packageIdentifier, offeringIdentifier: offeringIdentifier) { package in
            guard let package = package else {
                let error = productNotFoundError(description: "Couldn't find package", userCancelled: false)
                completion(nil, error)
                return
            }

            if let signedDiscountTimestamp = signedDiscountTimestamp {
                if #available(iOS 12.2, macOS 10.14.4, tvOS 12.2, *) {
                    guard let promotionalOffer = self.promoOffersByTimestamp[signedDiscountTimestamp] else {
                        completion(nil, productNotFoundError(description: "Couldn't find discount.", userCancelled: false))
                        return
                    }
                    Self.sharedInstance.purchase(package: package,
                                              promotionalOffer: promotionalOffer,
                                              completion: hybridCompletion)
                    return
                }

            }

            Self.sharedInstance.purchase(package: package, completion: hybridCompletion)
        }

    }

    @objc(makeDeferredPurchase:completionBlock:)
    static func makeDeferredPurchase(_ startPurchase: StartPurchaseBlock,
                                     completion: @escaping ([String: Any]?, ErrorContainer?) -> Void) {
        startPurchase { transaction, customerInfo, error, userCancelled in
            if let error = error {
                completion(nil, Self.createErrorContainer(error: error, userCancelled: userCancelled))
            } else if let customerInfo = customerInfo,
                      let transaction = transaction {
                completion([
                    "customerInfo": customerInfo.dictionary,
                    "productIdentifier": transaction.productIdentifier
                ], nil)
            } else {
                let error = ErrorCode.unknownError as NSError
                completion(nil, ErrorContainer(error: error, extraPayload: [:]))
            }
        }
    }

}

// MARK: identity
@objc public extension CommonFunctionality {

    @objc(logInWithAppUserID:completionBlock:)
    static func logIn(appUserID: String, completion: @escaping ([String: Any]?, ErrorContainer?) -> Void) {
        Self.sharedInstance.logIn(appUserID) { customerInfo, created, error in
            if let error = error {
                completion(nil, ErrorContainer(error: error, extraPayload: [:]))
            } else if let customerInfo = customerInfo {
                completion([
                    "customerInfo": customerInfo.dictionary,
                    "created": created
                ], nil)
            } else {
                let error = ErrorCode.unknownError as NSError
                completion(nil, ErrorContainer(error: error, extraPayload: [:]))
            }
        }
    }

    @objc(logOutWithCompletionBlock:)
    static func logOut(completion: @escaping ([String: Any]?, ErrorContainer?) -> Void) {
        Self.sharedInstance.logOut(completion: customerInfoCompletionBlock(from: completion))
    }

    @objc(getCustomerInfoWithCompletionBlock:)
    static func customerInfo(completion: @escaping ([String: Any]?, ErrorContainer?) -> Void) {
        Self.customerInfo(fetchPolicy: .default, completion: completion)
    }

    internal static func customerInfo(
        fetchPolicy: CacheFetchPolicy,
        completion: @escaping ([String: Any]?, ErrorContainer?) -> Void
    ) {
        Self.sharedInstance.getCustomerInfo(fetchPolicy: fetchPolicy,
                                         completion: customerInfoCompletionBlock(from: completion))
    }

}

// MARK: offerings and eligibility
@objc public extension CommonFunctionality {

    @objc(getOfferingsWithCompletionBlock:)
    static func getOfferings(completion: @escaping ([String: Any]?, ErrorContainer?) -> Void) {
        Self.sharedInstance.getOfferings { offerings, error in
            if let error = error {
                let errorContainer = ErrorContainer(error: error, extraPayload: [:])
                completion(nil, errorContainer)
            } else {
                completion(offerings?.dictionary, nil)
            }
        }
    }


    @objc(checkTrialOrIntroductoryPriceEligibility:completionBlock:)
    static func checkTrialOrIntroductoryPriceEligibility(
        for products: [String],
        completion: @escaping([String: Any]) -> Void) {
            Self.sharedInstance.checkTrialOrIntroDiscountEligibility(productIdentifiers: products) { eligibilityByProductId in
                completion(eligibilityByProductId.mapValues { [
                    "status": $0.status.rawValue,
                    "description": $0.description
                ] as [String: Any]
                })
            }
        }


    @objc static func getProductInfo(_ productIds: [String], completionBlock: @escaping([[String: Any]]) -> Void) {
        Self.sharedInstance.getProducts(productIds) { products in
            let productDictionaries = products
                .map { $0.rc_dictionary }
            completionBlock(productDictionaries)
        }
    }

    @objc(promotionalOfferForProductIdentifier:discount:completionBlock:)
    static func promotionalOffer(for productIdentifier: String,
                                 discountIdentifier: String?,
                                 completion: @escaping ([String: Any]?, ErrorContainer?) -> Void) {
        guard #available(iOS 12.2, macOS 10.14.4, tvOS 12.2, *) else {
            completion(
                nil,
                Self.createErrorContainer(error: ErrorCode.unsupportedError)
            )
            return
        }

        product(with: productIdentifier) { storeProduct in
            guard let storeProduct = storeProduct else {
                completion(nil, productNotFoundError(description: "Couldn't find product", userCancelled: false))
                return
            }

            guard let discountToUse = self.discount(with: discountIdentifier, for: storeProduct) else {
                completion(nil, productNotFoundError(description: "Couldn't find discount", userCancelled: false))
                return
            }

            let promotionalOfferCompletion: (PromotionalOffer?, Error?) -> Void = { promotionalOffer, error in
                guard let promotionalOffer = promotionalOffer else {
                    completion(
                        nil,
                        ErrorContainer(error: error ?? ErrorCode.unknownError as NSError,
                                       extraPayload: [:])
                    )
                    return
                }
                promoOffersByTimestamp["\(promotionalOffer.signedData.timestamp)"] = promotionalOffer
                completion(promotionalOffer.rc_dictionary, nil)
            }

            Self.sharedInstance.getPromotionalOffer(forProductDiscount: discountToUse,
                                                 product: storeProduct,
                                                 completion: promotionalOfferCompletion)
        }
    }

}

// MARK: Subscriber attributes
@objc public extension CommonFunctionality {

    @objc static func setAttributes(_ attributes: [String: Any]) {
        Self.sharedInstance.attribution.setAttributes(attributes.mapValues { $0 as? String ?? "" })
    }

    @objc static func setEmail(_ email: String?) {
        Self.sharedInstance.attribution.setEmail(email)
    }

    @objc static func setPhoneNumber(_ phoneNumber: String?) {
        Self.sharedInstance.attribution.setPhoneNumber(phoneNumber)
    }

    @objc static func setDisplayName(_ displayName: String?) {
        Self.sharedInstance.attribution.setDisplayName(displayName)
    }

    @objc static func setPushToken(_ pushToken: String?) {
         Self.sharedInstance.attribution.setPushTokenString(pushToken)
    }

}

// MARK: Attribution IDs
@objc public extension CommonFunctionality {

    @objc static func collectDeviceIdentifiers() {
        Self.sharedInstance.attribution.collectDeviceIdentifiers()
    }
    @objc static func setAdjustID(_ adjustID: String?) {
        Self.sharedInstance.attribution.setAdjustID(adjustID)
    }
    @objc static func setCleverTapID(_ cleverTapID: String?) {
        Self.sharedInstance.attribution.setCleverTapID(cleverTapID)
    }
    @objc static func setAppsflyerID(_ appsflyerID: String?) {
        Self.sharedInstance.attribution.setAppsflyerID(appsflyerID)
    }
    @objc static func setFBAnonymousID(_ fbAnonymousID: String?) {
        Self.sharedInstance.attribution.setFBAnonymousID(fbAnonymousID)
    }
    @objc static func setMparticleID(_ mParticleID: String?) {
        Self.sharedInstance.attribution.setMparticleID(mParticleID)
    }
    @objc static func setMixpanelDistinctID(_ mixpanelDistinctID: String?) {
        Self.sharedInstance.attribution.setMixpanelDistinctID(mixpanelDistinctID)
    }
    @objc static func setFirebaseAppInstanceID(_ firebaseAppInstanceID: String?) {
        Self.sharedInstance.attribution.setFirebaseAppInstanceID(firebaseAppInstanceID)
    }
    @objc static func setOnesignalID(_ onesignalID: String?) {
        Self.sharedInstance.attribution.setOnesignalID(onesignalID)
    }
    @objc static func setAirshipChannelID(_ airshipChannelID: String?) {
        Self.sharedInstance.attribution.setAirshipChannelID(airshipChannelID)
    }

}

// MARK: Campaign parameters
@objc public extension CommonFunctionality {

    @objc static func setMediaSource(_ mediaSource: String?) {
        Self.sharedInstance.attribution.setMediaSource(mediaSource)
    }
    @objc static func setCampaign(_ campaign: String?) {
        Self.sharedInstance.attribution.setCampaign(campaign)
    }
    @objc static func setAdGroup(_ adGroup: String?) {
        Self.sharedInstance.attribution.setAdGroup(adGroup)
    }
    @objc static func setAd(_ ad: String?) {
        Self.sharedInstance.attribution.setAd(ad)
    }
    @objc static func setKeyword(_ keyword: String?) {
        Self.sharedInstance.attribution.setKeyword(keyword)
    }
    @objc static func setCreative(_ creative: String?) {
        Self.sharedInstance.attribution.setCreative(creative)
    }

}

private extension CommonFunctionality {

    static func customerInfoCompletionBlock(from block: @escaping ([String: Any]?, ErrorContainer?) -> Void)
    -> ((CustomerInfo?, Error?) -> Void) {
        return { customerInfo, error in
            if let error = error {
                let errorContainer = ErrorContainer(error: error, extraPayload: [:])
                block(nil, errorContainer)
            } else if let customerInfo = customerInfo {
                block(customerInfo.dictionary, nil)
            } else {
                block(nil, ErrorContainer(error: ErrorCode.unknownError as NSError, extraPayload: [:]))
            }
        }

    }

    static func product(with identifier: String, completion: @escaping (StoreProduct?) -> Void) {
        Self.sharedInstance.getProducts([identifier]) { products in
            completion(products.first { $0.productIdentifier == identifier })
        }
    }

    static func productNotFoundError(description: String, userCancelled: Bool?) -> ErrorContainer {
        let error = NSError(domain: ErrorCode.errorDomain,
                            code: ErrorCode.productNotAvailableForPurchaseError.rawValue,
                            userInfo: [NSLocalizedDescriptionKey: description])
        return Self.createErrorContainer(error: error, userCancelled: userCancelled)
    }

    static func package(withIdentifier packageIdentifier: String,
                        offeringIdentifier: String,
                        completion: @escaping(Package?) -> Void) {
        Self.sharedInstance.getOfferings { offerings, error in
            let offering = offerings?.offering(identifier: offeringIdentifier)
            let package = offering?.package(identifier: packageIdentifier)
            completion(package)
        }
    }

    @available(iOS 12.2, macOS 10.14.4, tvOS 12.2, *)
    static func discount(with identifier: String?, for product: StoreProduct) -> StoreProductDiscount? {
        if identifier == nil {
            return product.discounts.first
        } else {
            return product.discounts.first { $0.offerIdentifier == identifier }
        }
    }

    static func processRefundRequestResultWithCompletion(
        refundRequestResult: Result<RefundRequestStatus, PublicError>,
        completion: @escaping (ErrorContainer?) -> Void
    ) {
        switch refundRequestResult {
        case let .success(refundRequestStatus):
            switch refundRequestStatus {
            case .success:
                completion(nil)
            case .userCancelled:
                completion(Self.refundRequestError(description: "User cancelled refund request.", userCancelled: true))
            case .error:
                completion(Self.refundRequestError(description: "Error during refund request."))
            }
        case let .failure(error):
            completion(ErrorContainer(error: error, extraPayload: [:]))
        }
    }

    static func refundRequestError(description: String, userCancelled: Bool? = nil) -> ErrorContainer {
        let error = NSError(domain: ErrorCode.errorDomain,
                            code: ErrorCode.beginRefundRequestError.rawValue,
                            userInfo: [NSLocalizedDescriptionKey: description])
        return Self.createErrorContainer(error: error, userCancelled: userCancelled)
    }

    static func createErrorContainer(error: Error, userCancelled: Bool? = nil) -> ErrorContainer {
        var extraPayload: [String: Any] = [:]
        if let userCancelled = userCancelled {
            extraPayload["userCancelled"] = userCancelled
        }

        return ErrorContainer(error: error, extraPayload: extraPayload)
    }

}

// MARK: - Encoding

@objc public extension CommonFunctionality {

    // Note: see https://github.com/RevenueCat/purchases-hybrid-common/pull/485
    // `CustomerInfo.dictionary` can't be made an `@objc public` method while supporting iOS < 13.0
    @objc(encodeCustomerInfo:)
    static func encode(customerInfo: CustomerInfo) -> [String: Any] {
        return customerInfo.dictionary
    }

}
