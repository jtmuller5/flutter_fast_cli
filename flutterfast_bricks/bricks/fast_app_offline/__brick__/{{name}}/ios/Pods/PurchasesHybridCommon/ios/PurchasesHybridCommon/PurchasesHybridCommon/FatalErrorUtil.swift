//
//  FatalErrorUtil.swift
//  PurchasesHybridCommon
//
//  Created by Andrés Boedo on 4/20/22.
//  Copyright © 2022 RevenueCat. All rights reserved.
//

import Foundation

enum FatalErrorUtil {

    fileprivate static var fatalErrorClosure: (String, StaticString, UInt) -> Never = defaultFatalErrorClosure

    private static let defaultFatalErrorClosure = { Swift.fatalError($0, file: $1, line: $2) }

    static func replaceFatalError(closure: @escaping (String, StaticString, UInt) -> Never) {
        fatalErrorClosure = closure
    }

    static func restoreFatalError() {
        fatalErrorClosure = defaultFatalErrorClosure
    }
}

func fatalError(_ message: @autoclosure () -> String = "", file: StaticString = #fileID, line: UInt = #line) -> Never {
    FatalErrorUtil.fatalErrorClosure(message(), file, line)
}
