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
}

// MARK: - Collection
extension QueueArray {
    public typealias Element = Element

    public typealias Index = Int

    public var startIndex: Int {
        return array.startIndex
    }
    
    public var endIndex: Int {
        return array.endIndex
    }
    
    public func index(after i: Int) -> Int {
        return array.index(after: i)
    }

    public subscript(position: Int) -> Element {
        if position == endIndex {
            let index = Swift.max(position - 1, 0)
            return array[index]
        }
        return array[position]
    }
}
