//
//  PromotionalOffer+HybridAdditions.swift
//  PurchasesHybridCommon
//
//  Created by Andrés Boedo on 4/13/22.
//  Copyright © 2022 RevenueCat. All rights reserved.
//

import Foundation
import RevenueCat

@objc public extension PromotionalOffer {

    var rc_dictionary: [String: Any] {
        return [
            "identifier": self.signedData.identifier,
            "keyIdentifier": self.signedData.keyIdentifier,
            "nonce": self.signedData.nonce.uuidString,
            "signature": self.signedData.signature,
            "timestamp": self.signedData.timestamp
        ]
    }

}
