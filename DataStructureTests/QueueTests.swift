//
//  QueueTests.swift
//  DataStructureTests
//
//  Created by drake on 2024/8/23.
//

import Testing
@testable import DataStructure

struct QueueTests {

    @Test func check_IsEmpty() async throws {
        var queue = Queue<Int>()
        
        #expect(queue.isEmpty)

        queue.enqueue(1)
        queue.enqueue(2)
        #expect(queue.isEmpty == false)
        #expect(queue.peek() == 1)

        #expect(queue.dequeue() == 1)
        #expect(queue.peek() == 2)
    }
    @Test func checkQueueIterator() {
        var queue = Queue<Int>()

        queue.enqueue(0)
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)

        #expect(queue[queue.startIndex] == 0)
        #expect(queue[queue.endIndex] == 3)
        
        queue.enumerated().forEach { offset, value in
            #expect(offset == value)
        }
    }
    @Test func copyOnWrite() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)

        var queue2 = queue
        
        #expect(queue.count == 3)
        #expect(queue2.count == 3)
        
        #expect(queue2.dequeue() == 1)
        #expect(queue2.dequeue() == 2)
        #expect(queue.peek() == 1)
        

        #expect(queue.count == 3)
        #expect(queue2.count == 1)
    }
}
