//
//  Offering+HybridAdditions.swift
//  PurchasesHybridCommon
//
//  Created by Andrés Boedo on 4/13/22.
//  Copyright © 2022 RevenueCat. All rights reserved.
//

import Foundation
import RevenueCat

@objc public extension Offering {

    @objc var dictionary: [String: Any] {
        var result: [String: Any] = [
            "identifier": identifier,
            "serverDescription": serverDescription,
            "metadata": metadata,
            "availablePackages": availablePackages.map { $0.dictionary(identifier) }
        ]

        if let lifetime = lifetime {
            result["lifetime"] = lifetime.dictionary(identifier)
        }
        if let annual = annual {
            result["annual"] = annual.dictionary(identifier)
        }
        if let sixMonth = sixMonth {
            result["sixMonth"] = sixMonth.dictionary(identifier)
        }
        if let threeMonth = threeMonth {
            result["threeMonth"] = threeMonth.dictionary(identifier)
        }
        if let twoMonth = twoMonth {
            result["twoMonth"] = twoMonth.dictionary(identifier)
        }
        if let monthly = monthly {
            result["monthly"] = monthly.dictionary(identifier)
        }
        if let weekly = weekly {
            result["weekly"] = weekly.dictionary(identifier)
        }

        return result
    }

}
