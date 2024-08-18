//
//  CustomerInfo+HybridAdditions.swift
//  PurchasesHybridCommon
//
//  Created by Andrés Boedo on 4/13/22.
//  Copyright © 2022 RevenueCat. All rights reserved.
//

import Foundation
import RevenueCat

internal extension CustomerInfo {

    var dictionary: [String: Any] {
        let sortedProductIdentifiers = allPurchasedProductIdentifiers.sorted()

        var allExpirations: [String: Any] = [:]
        var allExpirationsMillis: [String: Any] = [:]

        var allPurchases: [String: Any] = [:]
        var allPurchasesMillis: [String: Any] = [:]

        for identifier in sortedProductIdentifiers {
            let expirationDate = expirationDate(forProductIdentifier:identifier)
            allExpirations[identifier] = expirationDate?.rc_formattedAsISO8601() ?? NSNull()
            allExpirationsMillis[identifier] = expirationDate?.rc_millisecondsSince1970AsDouble() ?? NSNull()

            let purchaseDate = purchaseDate(forProductIdentifier: identifier)
            allPurchases[identifier] = purchaseDate?.rc_formattedAsISO8601() ?? NSNull()
            allPurchasesMillis[identifier] = purchaseDate?.rc_millisecondsSince1970AsDouble() ?? NSNull()
        }

        return [
            "entitlements": entitlements.dictionary,
            "activeSubscriptions": Array(activeSubscriptions),
            "allPurchasedProductIdentifiers": Array(allPurchasedProductIdentifiers),
            "latestExpirationDate": latestExpirationDate?.rc_formattedAsISO8601() ?? NSNull(),
            "latestExpirationDateMillis": latestExpirationDate?.rc_millisecondsSince1970AsDouble() ?? NSNull(),
            "firstSeen": firstSeen.rc_formattedAsISO8601(),
            "firstSeenMillis": firstSeen.rc_millisecondsSince1970AsDouble(),
            "originalAppUserId": originalAppUserId,
            "requestDate": requestDate.rc_formattedAsISO8601(),
            "requestDateMillis": requestDate.rc_millisecondsSince1970AsDouble(),
            "allExpirationDates": allExpirations,
            "allExpirationDatesMillis": allExpirationsMillis,
            "allPurchaseDates": allPurchases,
            "allPurchaseDatesMillis": allPurchasesMillis,
            "originalApplicationVersion": originalApplicationVersion ?? NSNull(),
            "originalPurchaseDate": originalPurchaseDate?.rc_formattedAsISO8601() ?? NSNull(),
            "originalPurchaseDateMillis": originalPurchaseDate?.rc_millisecondsSince1970AsDouble() ?? NSNull(),
            "managementURL": managementURL?.absoluteString ?? NSNull(),
            "nonSubscriptionTransactions": nonSubscriptions.map { $0.dictionary },
        ]
    }

}
