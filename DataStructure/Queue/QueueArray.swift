//
//  QueueArray.swift
//  DataStructure
//
//  Created by drake on 2024/8/26.
//

import Foundation

public struct QueueArray<Element> {

    private var array: [Element]

    init() {
        self.array = []
    }
}

// MARK: - CustomStringConvertible
extension QueueArray: CustomStringConvertible {

    public var description: String {
        return array.description
    }
}


// MARK: - Queue
extension QueueArray: Queue {
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public var peek: Element? {
        return array.first
    }
    
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> Element? {
        guard !isEmpty else {
            return nil
        }
        return array.removeFirst()
    }

    // MARK: - Sequence
    public typealias Iterator = AnyIterator<Element>

    public func makeIterator() -> AnyIterator<Element> {
        var index: Int = .zero
        let count = self.count
        return AnyIterator<Element> {
            guard self.isEmpty == false, index < count else {
                return nil
            }
            defer { index += 1 }
            return array[index]
        }
    }
}
