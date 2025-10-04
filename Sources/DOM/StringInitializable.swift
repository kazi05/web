//
//  StringInitializable.swift
//  DOM
//
//  Created by Mihael Isaev on 23.12.2020.
//

import WebFoundation

@MainActor
public protocol StringInitializable: AnyObject {
    init <U>(_ value: U) where U: UniValue, U.UniValue == String
}

@MainActor
protocol _StringInitializable: _BaseContentElementable, StringInitializable {
    var value: String { get set }
}

extension _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
}
