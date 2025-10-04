//
//  Prefix+UnitValuable.swift
//  Web
//
//  Created by Mihael Isaev on 21.01.2021.
//

import CSS

prefix operator -
@MainActor public prefix func -<U>(rhs: U) -> UnitValue where U: UnitValuable {
    UnitValue(-1 * rhs.value.doubleValue, rhs.unit)
}
