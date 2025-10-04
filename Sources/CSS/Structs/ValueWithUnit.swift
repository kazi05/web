//
//  ValueWithUnit.swift
//  CSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

import WebFoundation

public struct ValueWithUnit<V: Doubleable>: @MainActor UnitValuable, @MainActor UniValue, @MainActor PropertyValueImportantable {
    public let value: V
    public let unit: Unit
    
    public init (_ value: V, _ unit: Unit) {
        self.value = value
        self.unit = unit
    }
    
    @MainActor public var important: Self { .init(value, unit.important) }
    
    public typealias UniValue = UnitValue
    @MainActor public var uniValue: UnitValue { UnitValue(value.doubleValue, unit) }
    @MainActor public var uniStateValue: State<UnitValue>? { nil }
}
