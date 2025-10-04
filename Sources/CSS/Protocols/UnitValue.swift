//
//  UnitValue.swift
//  CSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

import WebFoundation

public protocol AnyUnitValuable: CustomStringConvertible {}

public protocol UnitValuable: AnyUnitValuable {
    associatedtype V: Doubleable
    
    var value: V { get }
    var unit: Unit { get }
}

@MainActor
public class UnitValue: @MainActor  UnitValuable, @MainActor UniValue, @MainActor _PropertyValueInnerChangeable, @preconcurrency CustomStringConvertible {
    @State public var value: Double = 0
    @State public var unit: Unit = .px
    
    public var description: String { "\(value)\(unit.value)" }
    
    public var uniValue: UnitValue { self }
    public lazy var uniStateValue: State<UnitValue>? = .init(wrappedValue: self)
    
    var _changeHandler = {}
    
    public init <D, U>(_ value: D, _ unit: U, important: Bool? = nil) where D: UniValue, D.UniValue == Double, U: UniValue, U.UniValue == Unit {
        self.value = value.uniValue
        self.unit = important == true ? unit.uniValue.important : unit.uniValue
        if let state = value.uniStateValue {
            $value.merge(with: state, leftChanged: { _ in
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            }, rightChanged: { _ in
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            })
        } else {
            $value.listen {
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            }
        }
        if let state = unit.uniStateValue {
            $unit.merge(with: state, leftChanged: { _ in
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            }, rightChanged: { _ in
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            })
        } else {
            $unit.listen {
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            }
        }
    }
    
    public init <D>(_ value: D, _ unit: Unit, important: Bool? = nil) where D: UniValue, D.UniValue == Double {
        self.value = value.uniValue
        self.unit = important == true ? unit.important : unit
        if let state = value.uniStateValue {
            $value.merge(with: state, leftChanged: { _ in
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            }, rightChanged: { _ in
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            })
        } else {
            $value.listen {
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            }
        }
    }
}

extension State where Value == Double {
    @MainActor public var cm: State<UnitValue> { self.map { UnitValue($0, .cm) } }
    @MainActor public var mm: State<UnitValue> { self.map { UnitValue($0, .mm) } }
    @MainActor public var `in`: State<UnitValue> { self.map { UnitValue($0, .in) } }
    @MainActor public var px: State<UnitValue> { self.map { UnitValue($0, .px) } }
    @MainActor public var pt: State<UnitValue> { self.map { UnitValue($0, .pt) } }
    @MainActor public var pc: State<UnitValue> { self.map { UnitValue($0, .pc) } }
    @MainActor public var fr: State<UnitValue> { self.map { UnitValue($0, .fr) } }
    @MainActor public var em: State<UnitValue> { self.map { UnitValue($0, .em) } }
    @MainActor public var ex: State<UnitValue> { self.map { UnitValue($0, .ex) } }
    @MainActor public var ch: State<UnitValue> { self.map { UnitValue($0, .ch) } }
    @MainActor public var rem: State<UnitValue> { self.map { UnitValue($0, .rem) } }
    @MainActor public var vw: State<UnitValue> { self.map { UnitValue($0, .vw) } }
    @MainActor public var vh: State<UnitValue> { self.map { UnitValue($0, .vh) } }
    @MainActor public var vmin: State<UnitValue> { self.map { UnitValue($0, .vmin) } }
    @MainActor public var vmax: State<UnitValue> { self.map { UnitValue($0, .vmax) } }
    @MainActor public var percent: State<UnitValue> { self.map { UnitValue($0, .percent) } }
}

extension UnitValuable {
    public var description: String { "\(value)\(unit.value)" }
    
    @MainActor public var cm: ValueWithUnit<V> { .init(value, .cm) }
    @MainActor public var mm: ValueWithUnit<V> { .init(value, .mm) }
    @MainActor public var `in`: ValueWithUnit<V> { .init(value, .in) }
    @MainActor public var px: ValueWithUnit<V> { .init(value, .px) }
    @MainActor public var pt: ValueWithUnit<V> { .init(value, .pt) }
    @MainActor public var pc: ValueWithUnit<V> { .init(value, .pc) }
    @MainActor public var fr: ValueWithUnit<V> { .init(value, .fr) }
    @MainActor public var em: ValueWithUnit<V> { .init(value, .em) }
    @MainActor public var ex: ValueWithUnit<V> { .init(value, .ex) }
    @MainActor public var ch: ValueWithUnit<V> { .init(value, .ch) }
    @MainActor public var rem: ValueWithUnit<V> { .init(value, .rem) }
    @MainActor public var vw: ValueWithUnit<V> { .init(value, .vw) }
    @MainActor public var vh: ValueWithUnit<V> { .init(value, .vh) }
    @MainActor public var vmin: ValueWithUnit<V> { .init(value, .vmin) }
    @MainActor public var vmax: ValueWithUnit<V> { .init(value, .vmax) }
    @MainActor public var percent: ValueWithUnit<V> { .init(value, .percent) }
    
    @MainActor public func unit(_ u: Unit) -> ValueWithUnit<V> { .init(value, u) }
}

extension UInt: @MainActor UnitValuable {
    public var value: Self { self }
    @MainActor public var unit: Unit { .px }
}

extension UInt8: @MainActor UnitValuable {
    public var value: Self { self }
    @MainActor public var unit: Unit { .px }
}

extension UInt16: @MainActor UnitValuable {
    public var value: Self { self }
    @MainActor public var unit: Unit { .px }
}

extension UInt32: @MainActor UnitValuable {
    public var value: Self { self }
    @MainActor public var unit: Unit { .px }
}

extension UInt64: @MainActor UnitValuable {
    public var value: Self { self }
    @MainActor public var unit: Unit { .px }
}

extension Int: @MainActor UnitValuable {
    public var value: Self { self }
    @MainActor public var unit: Unit { .px }
}

extension Int8: @MainActor UnitValuable {
    public var value: Self { self }
    @MainActor public var unit: Unit { .px }
}

extension Int16: @MainActor UnitValuable {
    public var value: Self { self }
    @MainActor public var unit: Unit { .px }
}

extension Int32: @MainActor UnitValuable {
    public var value: Self { self }
    @MainActor public var unit: Unit { .px }
}

extension Int64: @MainActor UnitValuable {
    public var value: Self { self }
    @MainActor public var unit: Unit { .px }
}

extension Double: @MainActor UnitValuable {
    public var value: Double { self }
    @MainActor public var unit: Unit { .px }
}

extension Float32: @MainActor UnitValuable {
    public var value: Self { self }
    @MainActor public var unit: Unit { .px }
}
