//
//  ErrorContainer.swift
//  PurchasesHybridCommon
//
//  Created by Andrés Boedo on 4/13/22.
//  Copyright © 2022 RevenueCat. All rights reserved.
//

import Foundation
import RevenueCat

@objc(RCErrorContainer) public class ErrorContainer: NSObject {

    @objc public let code: Int
    @objc public let message: String
    @objc public let info: [String: Any]
    @objc public let error: NSError

    @objc public init(error: Error, extraPayload: [String: Any]) {
        var nsError = error as NSError

        var info = extraPayload
        info["code"] = nsError.code
        info["message"] = nsError.localizedDescription

        let underlyingErrorMessage = (nsError.userInfo[NSUnderlyingErrorKey] as? NSError)?.localizedDescription

        info["underlyingErrorMessage"] = underlyingErrorMessage ?? ""

        // todo: remove "readable_error_code" and instead send whole user info instead
        // also: code name is already exposed as error.code
        if let readableErrorCode = nsError.userInfo["readable_error_code"] {
            info["readableErrorCode"] = readableErrorCode
            info["readable_error_code"] = readableErrorCode

            // Reason behind this is because React Native doesn't let reject the promises passing more information
            // besides passing the original error, but it passes the extra userInfo from that error to the JS layer.
            // Since we want to pass both readable_error_code (deprecated) and readableErrorCode when building the
            // error JS object, and the error coming from purchases-ios only has the snake case version, we need to
            // add readableErrorCode to the userInfo of the error. In a future project, we will remove the
            // deprecated version and also improve error handling so it's easier to detect which errors come
            // from RevenueCat and which don't

            var fixedUserInfo = nsError.userInfo
            fixedUserInfo["readableErrorCode"] = readableErrorCode

            nsError = NSError(domain: nsError.domain, code: nsError.code, userInfo: fixedUserInfo)
        }

        self.code = nsError.code
        self.message = nsError.localizedDescription
        self.error = nsError

        self.info = info
    }
}
