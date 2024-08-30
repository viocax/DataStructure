//
//  LRUCache.swift
//  DataStructure
//
//  Created by drake on 2024/8/30.
//

import Foundation

final class LRUCache<Key: Hashable, Value> {

    private class Node<K: Hashable, E> {
        var value: E
        var key: K
        var next: Node<K, E>?
        var pre: Node<K, E>?
        init(key: K, value: E) {
            self.key = key
            self.value = value
        }
    }

    private var hashMap: [Key: Node<Key, Value>]
    private var head: Node<Key, Value>?
    private var tail: Node<Key, Value>?
    private let size: Int

    init(size: Int) {
        self.size = size
        self.hashMap = [:]
    }
}

extension LRUCache {
    
    public func get(_ key: Key) -> Value? {
        guard let node = hashMap[key] else {
            return nil
        }
        moveToFront(node: node)
        return node.value
    }

    public var isEmpty: Bool {
        return head == nil
    }

    public func put(key: Key, value: Value) {
        if let node = hashMap[key] {
            node.value = value
            moveToFront(node: node)
        } else {
            let newNode = Node(key: key, value: value)
            hashMap[key] = newNode
            head?.pre = newNode
            newNode.next = head
            head = newNode
            if tail == nil {
                tail = head
            }
        }
        if hashMap.count > size {
            tail = tail?.pre
            tail?.next = nil
            hashMap.removeValue(forKey: tail!.key)
        }
    }

    private func moveToFront(node: Node<Key, Value>) {
        guard node !== head else {
            return
        }
        if node !== tail {
            let tailChain = node.next
            let pre = node.pre
            pre?.next = tailChain
            tailChain?.pre = pre
            node.next = head
            head = node
        } else {
            tail = tail?.pre
            tail?.next = nil
            head?.pre = node
            node.next = head
            head = node
        }
    }
}

#if DEBUG
extension LRUCache {
    var outputOrderList: [Value] {
        return sequence(first: head) { node in
            return node?.next
        }.compactMap(\.?.value)
    }
}
#endif
