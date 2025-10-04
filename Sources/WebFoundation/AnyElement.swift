//
//  AnyElement.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 24.02.2021.
//

import Foundation

@MainActor
public protocol AnyElement: AnyObject {
    static var name: String { get }
}
