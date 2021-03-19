//
//  Stack.swift
//  DataStructure
//
//  Created by Jie liang Huang on 2021/3/19.
//

import Foundation

public struct Stack<Element> {
    private(set) var sequence: [Element]
    init(_ sequence: [Element] = []) {
        self.sequence = sequence.reversed()
    }
}

extension Stack {
    var isEmpty: Bool {
        return sequence.isEmpty
    }
    public mutating func push(_ element: Element) {
        sequence.insert(element, at: 0)
    }
    public mutating func pop() -> Element? {
        guard !isEmpty else {
            return nil
        }
        return sequence.removeFirst()
    }
}
