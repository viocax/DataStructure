//
//  Node.swift
//  DataStructure
//
//  Created by drake on 2024/8/20.
//

import Foundation

public class Node<Value> {

    public var value: Value

    public var next: Node<Value>?

    public init(value: Value, next: Node<Value>? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {

    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}
