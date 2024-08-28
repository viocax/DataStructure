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

// MARK: - Sequence
extension QueueLinkedList {

    public func makeIterator() -> AnyIterator<Element> {
        var currentNode = linkedList.first
        return AnyIterator<Element> {
            guard let node = currentNode else { return nil }
            defer {
                currentNode = currentNode?.next
            }
            return node.value
        }
    }
}
