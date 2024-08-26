//
//  Queue.swift
//  DataStructure
//
//  Created by drake on 2024/8/26.
//

import Foundation

public protocol Queue: Collection {

    associatedtype Element

    var isEmpty: Bool { get }

    var count: Int { get }

    var peek: Element? { get }

    @discardableResult
    mutating func enqueue(_ element: Element) -> Bool

    mutating func dequeue() -> Element?
}
