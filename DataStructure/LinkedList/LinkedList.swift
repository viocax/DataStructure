//
//  LinkedList.swift
//  DataStructure
//
//  Created by drake on 2024/8/20.
//

import Foundation

public struct LinkedList<Value> {

    private var head: Node<Value>?

    private var tail: Node<Value>?

    init(head: Node<Value>? = nil, tail: Node<Value>? = nil) {
        self.head = head
        self.tail = tail
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

// MARK: - LinkedList
extension LinkedList {
    // O(1)
    public var isEmpty: Bool {
        return head == nil
    }

    public var count: Int {
        var current = head
        var index = 0
        while let unwrapCurrent = current {
            current = unwrapCurrent.next
            index += 1
        }
        return index
    }

    public var last: Node<Value>? {
        return tail
    }
    public var first: Node<Value>? {
        return head
    }
    // push to front, O(1)
    public mutating func push(_ element: Value) {
        head = .init(value: element, next: head)
        if tail == nil {
            tail = head
        }
    }
    // add to tail, O(1)
    public mutating func append(_ element: Value) {
        guard !isEmpty else {
            push(element)
            return
        }
        let newNode = Node(value: element)
        tail?.next = newNode // replace last head next poiter
        tail = newNode
    }
    // out of range would be like append
    public mutating func insert(at index: Int, _ element: Value) {
        guard index > 0 else {
            push(element)
            return
        }

        if index >= count - 1 {
            append(element)
            return
        }
        let previousIndex = index - 1
        let previousNode = node(at: previousIndex)
        let nextNode = previousNode?.next
        let newNode = Node(value: element)
        previousNode?.next = newNode
        newNode.next = nextNode
    }
    
    // O(n)
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }

    @discardableResult
    public mutating func pop() -> Node<Value>? {
        guard let first = head else {
            return nil
        }
        head = first.next
        if head == nil {
            tail = nil
        }
        return .init(value: first.value)
    }
    @discardableResult
    public mutating func remove(at index: Int) -> Node<Value>? {
        guard index > .zero else {
            return pop()
        }
        let previousNode = node(at: index - 1)
        let targetNode = previousNode?.next
        previousNode?.next = targetNode?.next
        return targetNode
    }
    @discardableResult
    public mutating func removeLast() -> Node<Value>? {
        let count = self.count
        guard count > 1 else {
            return pop()
        }
        let previousIndex = max(count - 1 - 1, 0)
        let remove = tail
        let previous = node(at: previousIndex)
        previous?.next = nil
        tail = previous
        return remove
    }
}
