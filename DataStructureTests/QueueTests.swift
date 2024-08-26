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
        var queue1 = QueueLinkedList<Int>()
        var queue2 = QueueArray<Int>()

        func check<Q: Queue>(queue: inout Q) where Q.Element == Int {
            #expect(queue.isEmpty)

            #expect(queue.enqueue(1))
            #expect(queue.enqueue(2))
            #expect(queue.isEmpty == false)
            #expect(queue.peek == 1)

            #expect(queue.dequeue() == 1)
            #expect(queue.peek == 2)
        }
        check(queue: &queue1)
        check(queue: &queue2)
        check(queue: &queue3)
        
    }
    @Test func checkQueueIterator() {
        let queue = QueueLinkedList<Int>()
        let queue2 = QueueArray<Int>()
        
        func check<Q: Queue>(queue: Q) where Q.Element == Int {
            var queue = queue
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
        check(queue: queue)
        check(queue: queue2)
    }
    @Test func copyOnWrite() {
        let queue = QueueLinkedList<Int>()
        let queue2 = QueueArray<Int>()

        func check<Q: Queue>(queue: Q) where Q.Element == Int {
            var queue = queue
            queue.enqueue(1)
            queue.enqueue(2)
            queue.enqueue(3)

            var queue2 = queue
            
            #expect(queue.count == 3)
            #expect(queue2.count == 3)
            
            #expect(queue2.dequeue() == 1)
            #expect(queue2.dequeue() == 2)
            #expect(queue.peek == 1)
            

            #expect(queue.count == 3)
            #expect(queue2.count == 1)
        }
        check(queue: queue)
        check(queue: queue2)
    }
}
