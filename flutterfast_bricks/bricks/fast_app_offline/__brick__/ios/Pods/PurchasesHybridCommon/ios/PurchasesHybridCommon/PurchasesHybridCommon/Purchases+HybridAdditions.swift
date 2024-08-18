//
//  Purchases+HybridAdditions.swift
//  PurchasesHybridCommon
//
//  Created by Andrés Boedo on 4/13/22.
//  Copyright © 2022 RevenueCat. All rights reserved.
//

import Foundation
import RevenueCat

@objc public extension Purchases {

    @objc(configureWithAPIKey:appUserID:observerMode:userDefaultsSuiteName:platformFlavor:platformFlavorVersion:
            usesStoreKit2IfAvailable:dangerousSettings:)
    static func configure(apiKey: String,
                          appUserID: String?,
                          observerMode: Bool,
                          userDefaultsSuiteName: String?,
                          platformFlavor: String?,
                          platformFlavorVersion: String?,
                          usesStoreKit2IfAvailable: Bool = false,
                          dangerousSettings: DangerousSettings?) -> Purchases {
        var userDefaults: UserDefaults?
        if let userDefaultsSuiteName = userDefaultsSuiteName {
            userDefaults = UserDefaults(suiteName: userDefaultsSuiteName)
            guard userDefaults != nil else {
                fatalError("Could not create an instance of UserDefaults with suite name \(userDefaultsSuiteName)")
            }
        }

        var configurationBuilder: Configuration.Builder = .init(withAPIKey: apiKey)
        if let appUserID = appUserID {
            configurationBuilder = configurationBuilder.with(appUserID: appUserID)
        }
        configurationBuilder = configurationBuilder.with(observerMode: observerMode)
        if let userDefaults = userDefaults {
            configurationBuilder = configurationBuilder.with(userDefaults: userDefaults)
        }
        configurationBuilder = (configurationBuilder as ConfigurationBuilderDeprecatable)
            // Allows silencing deprecation warning, so `pod lib lint` does not fail.
            .with(usesStoreKit2IfAvailable: usesStoreKit2IfAvailable)
        if let dangerousSettings = dangerousSettings {
            configurationBuilder = configurationBuilder.with(dangerousSettings: dangerousSettings)
        }
        if let platformFlavor = platformFlavor, let platformFlavorVersion = platformFlavorVersion {
            let platformInfo = Purchases.PlatformInfo(flavor: platformFlavor, version: platformFlavorVersion)
            configurationBuilder = configurationBuilder.with(platformInfo: platformInfo)
        }

        let purchases = self.configure(with: configurationBuilder.build())
        CommonFunctionality.sharedInstance = purchases

        return purchases
    }

}

extension LogLevel {

    static let levels: Set<LogLevel> = [
        .verbose,
        .debug,
        .info,
        .warn,
        .error,
    ]

    static let levelsByDescription: [String: LogLevel] = .init(
        uniqueKeysWithValues: LogLevel.levels.map { ($0.description, $0) }
    )
}

// MARK: - Deprecations

protocol ConfigurationBuilderDeprecatable {

    func with(usesStoreKit2IfAvailable: Bool) -> Configuration.Builder

}

extension Configuration.Builder: ConfigurationBuilderDeprecatable {}
