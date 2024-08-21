//
//  Stack.swift
//  DataStructure
//
//  Created by drake on 2024/8/19.
//
import Foundation

public struct Stack<Element> {

    public private(set) var elements: [Element]

    public init(elements: [Element] = []) {
        self.elements = elements
    }
}

// MARK: - ExpressibleByArrayLiteral
extension Stack: ExpressibleByArrayLiteral {

    public typealias ArrayLiteralElement = Element

    public init(arrayLiteral elements: Element...) {
        self.elements = elements
    }
}

// MARK: -
extension Stack {

    public var isEmpty: Bool {
        return elements.isEmpty
    }

    public var count: Int {
        return elements.count
    }

    func peek() -> Element? {
        return elements.first
    }

    mutating func push(_ element: Element) {
        self.elements.insert(element, at: .zero)
    }

    mutating func pop() -> Element? {
        if isEmpty == false {
            return elements.removeFirst()
        }
        return nil
    }
}

extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
        return elements.reduce("") { partialResult, nextElement -> String in
            let string = if let nextString = (nextElement as? CustomStringConvertible)?.description {
                nextString
            } else {
                "\(nextElement)"
            }
            return "\(partialResult) \(string)"
        }
    }
}

extension Stack: Collection {

    public typealias Index = Int

    public typealias Element = Element

    public var startIndex: Int {
        return elements.startIndex
    }
    public var endIndex: Int {
        return elements.endIndex
    }
    public func index(after i: Int) -> Int {
        return elements.index(after: i)
    }
    public subscript(position: Int) -> Element {
        return elements[position]
    }
}
