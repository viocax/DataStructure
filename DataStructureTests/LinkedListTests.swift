//
//  LinkedListTests.swift
//  DataStructureTests
//
//  Created by drake on 2024/8/20.
//

import Testing
@testable import DataStructure

struct LinkedListTests {

    @Test func linkedList_isEmpty() async throws {
        var linkedList = LinkedList<Int>()
        #expect(linkedList.isEmpty)
        linkedList.head = .init(value: 2)
        #expect(!linkedList.isEmpty)
    }
    @Test func linkedList_push() async throws {
        var linkedList = LinkedList<Int>()
        linkedList.push(1)
        #expect(linkedList.head?.value == 1)
        #expect(linkedList.head?.next?.value == nil)

        #expect(linkedList.tail?.value == 1)
        
        linkedList.push(2)
        #expect(linkedList.head?.value == 2)
        #expect(linkedList.head?.next?.value == 1)

        #expect(linkedList.tail?.value == 1)
        
        linkedList.push(3)
        #expect(linkedList.head?.value == 3)
        #expect(linkedList.head?.next?.value == 2)

        #expect(linkedList.tail?.value == 1)
    }
    @Test func linkedList_append() async throws {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        #expect(linkedList.head?.value == 1)
        #expect(linkedList.tail?.value == 1)
        linkedList.append(2)
        #expect(linkedList.head?.value == 1)
        #expect(linkedList.tail?.value == 2)
        linkedList.append(3)
        #expect(linkedList.head?.value == 1)
        #expect(linkedList.tail?.value == 3)

        #expect(linkedList.head?.value == 1)
        #expect(linkedList.head?.next?.value == 2)
        #expect(linkedList.head?.next?.next?.value == 3)
    }
    @Test func linkedList_getByIndex() async throws {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        linkedList.append(4)
        
        #expect(linkedList.node(at: 0)?.value == 1)
        #expect(linkedList.node(at: 1)?.value == 2)
        #expect(linkedList.node(at: 2)?.value == 3)
        #expect(linkedList.node(at: 3)?.value == 4)
        
    }
    @Test func linkedList_insert() {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        linkedList.append(4)

        #expect(linkedList.count == 4)

        linkedList.insert(at: 2, 9)
        #expect(linkedList.node(at: 1)?.value == 2)
        #expect(linkedList.node(at: 2)?.value == 9)
        #expect(linkedList.node(at: 3)?.value == 3)
        // 1, 2, 9, 3, 4,
        #expect(linkedList.count == 5)
        
        linkedList.insert(at: .zero, 0)
        #expect(linkedList.node(at: 0)?.value == 0)
        #expect(linkedList.node(at: 1)?.value == 1)
        
        linkedList.insert(at: .max, 999)
        #expect(linkedList.node(at: linkedList.count - 1)?.value == 999)
        #expect(linkedList.last?.value == 999)
    }
}
