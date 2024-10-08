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
        var queue3 = QueueBufferRing<Int>(size: 5)
        var queue4 = QueueStack<Int>()
        
        func check<Q: Queue>(queue: inout Q) where Q.Element == Int {
            #expect(queue.isEmpty)
            
            #expect(queue.enqueue(1) == true)
            #expect(queue.enqueue(2) == true)
            #expect(queue.isEmpty == false)
            #expect(queue.peek == 1)
            
            #expect(queue.dequeue() == 1)
            #expect(queue.peek == 2)
        }
        check(queue: &queue1)
        check(queue: &queue2)
        check(queue: &queue3)
        check(queue: &queue4)
        
    }
    @Test func checkQueueIterator() {
        let queue = QueueLinkedList<Int>()
        let queue2 = QueueArray<Int>()
        let queue3 = QueueBufferRing<Int>(size: 5)
        let queue4 = QueueStack<Int>()
        
        func check<Q: Queue>(queue: Q) where Q.Element == Int {
            var queue = queue
            #expect(queue.enqueue(0) == true)
            #expect(queue.enqueue(1) == true)
            #expect(queue.enqueue(2) == true)
            #expect(queue.enqueue(3) == true)
            
            queue.enumerated().forEach { offset, value in
                #expect(offset == value)
            }
        }
        check(queue: queue)
        check(queue: queue2)
        check(queue: queue3)
        check(queue: queue4)
    }
    @Test func copyOnWrite() {
        let queue = QueueLinkedList<Int>()
        let queue2 = QueueArray<Int>()
        let queue3 = QueueBufferRing<Int>(size: 5)
        let queue4 = QueueStack<Int>()
        
        func check<Q: Queue>(queue: Q) where Q.Element == Int {
            var queue = queue
            #expect(queue.enqueue(1) == true)
            #expect(queue.enqueue(2) == true)
            #expect(queue.enqueue(3) == true)
            
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
        check(queue: queue3)
        check(queue: queue4)
    }
    
    @Test func bufferRing() {
        var queue = QueueBufferRing<Int>(size: 3)
        #expect(queue.enqueue(1) == true)
        #expect(queue.enqueue(2) == true)
        #expect(queue.enqueue(3) == true)
        #expect(queue.enqueue(4) == false)

        #expect(queue.isEmpty == false)
        #expect(queue.peek == 1)
        #expect(queue.dequeue() == 1)
        #expect(queue.peek == 2)
        #expect(queue.dequeue() == 2)
        #expect(queue.peek == 3)
        #expect(queue.dequeue() == 3)
        #expect(queue.peek == nil)
        #expect(queue.isEmpty)
    }

    @Test func reversed() {
        let queue = QueueLinkedList<Int>()
        let queue2 = QueueArray<Int>()
        let queue3 = QueueBufferRing<Int>(size: 10)
        let queue4 = QueueStack<Int>()
        
        func check<Q: Queue>(queue: Q) where Q.Element == Int {
            var queue = queue
            let mockArray = [1, 2, 3, 4, 5, 6, 7]
            mockArray.forEach { interger in
                queue.enqueue(interger)
            }
            let result = queue.reversed()
            #expect(result == mockArray.reversed())
        }
        check(queue: queue)
        check(queue: queue2)
        check(queue: queue3)
        check(queue: queue4)
    }
}
