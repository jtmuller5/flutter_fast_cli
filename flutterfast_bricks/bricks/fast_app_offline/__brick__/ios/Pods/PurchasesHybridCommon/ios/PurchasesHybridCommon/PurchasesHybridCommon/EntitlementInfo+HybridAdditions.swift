//
//  EntitlementInfo+HybridAdditions.swift
//  PurchasesHybridCommon
//
//  Created by Andrés Boedo on 4/13/22.
//  Copyright © 2022 RevenueCat. All rights reserved.
//

import Foundation
import RevenueCat

internal extension EntitlementInfo {

    var dictionary: [String: Any] {
        return [
            "identifier": identifier,
            "isActive": isActive,
            "willRenew": willRenew,
            "periodType": periodTypeString,
            "latestPurchaseDate": latestPurchaseDate?.rc_formattedAsISO8601() ?? NSNull(),
            "latestPurchaseDateMillis": latestPurchaseDate?.rc_millisecondsSince1970AsDouble() ?? NSNull(),
            "originalPurchaseDate": originalPurchaseDate?.rc_formattedAsISO8601() ?? NSNull(),
            "originalPurchaseDateMillis": originalPurchaseDate?.rc_millisecondsSince1970AsDouble() ?? NSNull(),
            "expirationDate": expirationDate?.rc_formattedAsISO8601() ?? NSNull(),
            "expirationDateMillis": expirationDate?.rc_millisecondsSince1970AsDouble() ?? NSNull(),
            "store": storeString,
            "productIdentifier": productIdentifier,
            "isSandbox": isSandbox,
            "unsubscribeDetectedAt": unsubscribeDetectedAt?.rc_formattedAsISO8601() ?? NSNull(),
            "unsubscribeDetectedAtMillis": unsubscribeDetectedAt?.rc_millisecondsSince1970AsDouble() ?? NSNull(),
            "billingIssueDetectedAt": billingIssueDetectedAt?.rc_formattedAsISO8601() ?? NSNull(),
            "billingIssueDetectedAtMillis": billingIssueDetectedAt?.rc_millisecondsSince1970AsDouble() ?? NSNull(),
            "ownershipType": ownershipTypeString
        ]
    }

}

private extension EntitlementInfo {

    var periodTypeString: String {
        switch periodType {
        case .intro:
            return "INTRO"
        case .normal:
            return "NORMAL"
        case .trial:
            return "TRIAL"
        @unknown default:
            return "UNKNOWN"
        }
    }

    var ownershipTypeString: String {
        switch ownershipType {
        case .familyShared:
            return "FAMILY_SHARED"
        case .unknown:
            return "UNKNOWN"
        case .purchased:
            return "PURCHASED"
        @unknown default:
            return "UNKNOWN"
        }
    }

    var storeString: String {
        switch store {
        case .appStore:
            return "APP_STORE"
        case .macAppStore:
            return "MAC_APP_STORE"
        case .playStore:
            return "PLAY_STORE"
        case .promotional:
            return "PROMOTIONAL"
        case .unknownStore:
            return "UNKNOWN_STORE"
        case .amazon:
            return "AMAZON"
        case .stripe:
            return "STRIPE"
        @unknown default:
            return "UNKNOWN_STORE"
        }
    }

}
