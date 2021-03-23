//
//  LinkedList.swift
//  DataStructure
//
//  Created by Jie liang Huang on 2021/3/22.
//

import Foundation

/// Linked List Element: Node
/// 1. Hold Value
/// 2. Hold a referenc to next node. A `nil` value repersents the end of the lists

class Node<Value> {
    let value: Value
    var next: Node<Value>?
    init(_ value: Value, next: Node<Value>? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value)." + next.description
    }
}

extension Node: Equatable where Value: Equatable {
    static func == (lhs: Node<Value>, rhs: Node<Value>) -> Bool {
        return lhs.description == rhs.description
    }
}

struct LinkedList<Value> {
    
    // MARK: property
    var head: Node<Value>?
    var tail: Node<Value>?

    // MARK: initialization
    init() { }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        return head?.description ?? ""
    }
}

extension LinkedList {
    /// head equal `nil` means the end of linkedList
    var isEmpty: Bool {
        return tail == nil
    }
}

extension LinkedList {
    
    /// push:  add new node in front of list
    public mutating func push(_ value: Value) {
        head = Node(value, next: head)
        if tail == nil {
            tail = head
        }
    }

    /// append: add a value at the end of the list
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail?.next = Node(value)
        tail = tail?.next
    }

    /// pop: remove node in front of list
    public mutating func pop() {
        
    }
}
