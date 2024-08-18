//
//  Offerings+HybridAdditions.swift
//  PurchasesHybridCommon
//
//  Created by Andrés Boedo on 4/13/22.
//  Copyright © 2022 RevenueCat. All rights reserved.
//

import Foundation
import RevenueCat

internal extension Offerings {

    var dictionary: [String: Any] {
        var result: [String: Any] = ["all": all.mapValues { $0.dictionary }]
        if let current = current {
            result["current"] = current.dictionary
        }
        return result
    }
}
