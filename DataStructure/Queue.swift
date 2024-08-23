//
//  Queue.swift
//  DataStructure
//
//  Created by drake on 2024/8/23.
//

import Foundation

public class Queue<Element> {
    private var linkedList: LinkedList<Element>
    init() {
        self.linkedList = .init()
    }
}

extension Queue {

    public var isEmpty: Bool {
        return linkedList.isEmpty
    }

    public var count: Int {
        return .zero
    }

    public func enqueue(_ element: Element) {
        self.linkedList.append(element)
    }

    public func dequeue() -> Element? {
        return self.linkedList.pop()?.value
    }

    public func peek() -> Element? {
        return self.linkedList.first?.value
    }
}

// MARK: - CustomStringConvertible
extension Queue: CustomStringConvertible {

    public var description: String {
        return linkedList.description
    }
}

extension Queue: Collection {

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
