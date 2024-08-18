//
//  SKProductDiscount+HybridAdditions.swift
//  PurchasesHybridCommon
//
//  Created by Andrés Boedo on 4/13/22.
//  Copyright © 2022 RevenueCat. All rights reserved.
//

import Foundation
import StoreKit
import RevenueCat

internal extension StoreProductDiscount {

    var rc_currencyCode: String? {
        return currencyCode
    }

    var rc_dictionary: [String: Any] {

        var dictionary: [String: Any] = [
            "price": price,
            "priceString": localizedPriceString,
            "period": StoreProduct.rc_normalized(subscriptionPeriod: subscriptionPeriod),
            "periodUnit": StoreProduct.rc_normalized(subscriptionPeriodUnit: subscriptionPeriod.unit),
            "periodNumberOfUnits": subscriptionPeriod.value,
            "cycles": numberOfPeriods
        ]
        
        if #available(iOS 12.2, tvOS 12.2, macOS 10.14.4, *) {
            if offerIdentifier != nil {
                dictionary["identifier"] = offerIdentifier
            }
        }
        return dictionary
    }

}
