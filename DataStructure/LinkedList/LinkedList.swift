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
        guard !isEmpty else {
            return nil
        }
        guard head?.next != nil else {
            return pop()
        }
        var previous = head
        var current = head
        while let next = current?.next {
            previous = current
            current = next
        }
        previous?.next = nil
        tail = previous
        return current
    }
}

extension LinkedList: Collection {

    public struct Index: Comparable {
        fileprivate var node: Node<Value>?

        public static func == (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (l?, r?):
                return l.next === r.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        public static func < (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { node in
                return node?.next
            }
            return nodes.contains(where: { $0 === rhs.node })
        }
    }

    public var startIndex: Index {
        return Index(node: head)
    }
    
    public var endIndex: Index {
        return Index(node: tail)
    }

    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    public subscript(position: Index) -> Value {
        return position.node!.value
    }
}
