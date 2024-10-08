//
//  QueueBufferRing.swift
//  DataStructure
//
//  Created by drake on 2024/8/27.
//

import Foundation

public struct QueueBufferRing<Element> {
    fileprivate var ring: QueueBufferRing.BufferRing<Element>
    init(size: Int) {
        self.ring = .init(buffer: size)
    }
}


extension QueueBufferRing: Queue {
    
    private var isFull: Bool {
        return ring.isFull
    }
    public var isEmpty: Bool {
        return ring.isEmpty
    }
    public var count: Int {
        return ring.count
    }
    public var peek: Element? {
        return ring.array.first(where: { $0 != nil }) ?? nil
    }
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        return ring.write(element)
    }
    public mutating func dequeue() -> Element? {
        return ring.read()
    }

    // MARK: - Sequence
    public func makeIterator() -> AnyIterator<Element> {
        var values = ring.array.compactMap { $0 }
        return AnyIterator<Element> {
            guard !values.isEmpty else { return nil }
            return values.removeFirst()
        }
    }
    
}

extension QueueBufferRing: CustomStringConvertible {
    public var description: String {
        return ring.description
    }
}

// MARK: - QueueBufferRing.BufferRing
extension QueueBufferRing {
    public struct BufferRing<E> {
        fileprivate var array: [E?]
        fileprivate var readIndex: Int = .zero
        fileprivate var writeIndex: Int = .zero
        fileprivate let buffer: Int
        init(buffer count: Int) {
            self.buffer = count
            self.array = Array(repeating: nil, count: count)
        }
    }
}


extension QueueBufferRing.BufferRing {
    public mutating func write(_ element: E) -> Bool {
        guard !isFull else {
            return false
        }
        array[writeIndex % buffer] = element
        writeIndex += 1
        return true
    }
    public mutating func read() -> E? {
        guard !isEmpty else {
            return nil
        }
        defer {
            array[readIndex % buffer] = nil
            readIndex += 1
        }
        return array[readIndex % buffer]
    }
    public var isEmpty: Bool {
        return canReadSpacing == .zero
    }
    public var isFull: Bool {
        return canWriteSpacing == .zero
    }
    public var count: Int {
        return canReadSpacing
    }
    private var canReadSpacing: Int {
        return writeIndex - readIndex
    }
    private var canWriteSpacing: Int {
        return buffer - canReadSpacing
    }
}

extension  QueueBufferRing.BufferRing: CustomStringConvertible {
    public var description: String {
        return String(describing: array.description)
    }
}
