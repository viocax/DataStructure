//
//  Queue.swift
//  DataStructure
//
//  Created by drake on 2024/8/23.
//

import Foundation

public struct QueueLinkedList<Element> {
    private var linkedList: LinkedList<Element>
    init() {
        self.linkedList = .init()
    }
}

extension QueueLinkedList: Queue {

    public var isEmpty: Bool {
        return linkedList.isEmpty
    }

    public var count: Int {
        return linkedList.count
    }

    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        self.linkedList.append(element)
        return true
    }

    @discardableResult
    public mutating func dequeue() -> Element? {
        return self.linkedList.pop()?.value
    }

    public var peek: Element? {
        return self.linkedList.first?.value
    }
}

// MARK: - CustomStringConvertible
extension QueueLinkedList: CustomStringConvertible {

    public var description: String {
        return linkedList.description
    }
}

// MARK: - Collection
extension QueueLinkedList {

    public typealias Element = Element

    public typealias Index = LinkedList<Element>.Index

    public var startIndex: Index {
        return linkedList.startIndex
    }
    
    public var endIndex: Index {
        return linkedList.endIndex
    }
    
    public func index(after i: Index) -> Index {
        return linkedList.index(after: i)
    }

    public subscript(position: Index) -> Element {
        return linkedList[position]
    }
}
