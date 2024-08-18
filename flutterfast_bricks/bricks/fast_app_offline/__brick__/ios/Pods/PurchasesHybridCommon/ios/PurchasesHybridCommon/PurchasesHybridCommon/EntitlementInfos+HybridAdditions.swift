//
//  EntitlementInfos+HybridAdditions.swift
//  PurchasesHybridCommon
//
//  Created by Andrés Boedo on 4/13/22.
//  Copyright © 2022 RevenueCat. All rights reserved.
//

import Foundation
import RevenueCat

internal extension EntitlementInfos {

    var dictionary: [String: Any] {
        return [
            "all": all.mapValues { $0.dictionary },
            "active": active.mapValues { $0.dictionary }
        ]
    }

}

