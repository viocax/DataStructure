//
//  QueueStack.swift
//  DataStructure
//
//  Created by drake on 2024/8/28.
//

import Foundation

public struct QueueStack<Element> {

    private var leftStack: [Element] = []
    private var rightStack: [Element] = []

    public init() { }
}

// MARK: - Queue
extension QueueStack: Queue {

    public typealias Element = Element
    
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    public var peek: Element? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    public var count: Int {
        return leftStack.count + rightStack.count
    }
    
    public mutating func enqueue(_ element: Element) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> Element? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }

    public func makeIterator() -> AnyIterator<Element> {
        let new = leftStack.reversed() + rightStack
        return .init(new.makeIterator())
    }
}

// MARK: - CustomStringConvertible
extension QueueStack: CustomStringConvertible {
    public var description: String {
        let array = leftStack.reversed() + rightStack
        return array.description
    }
}
