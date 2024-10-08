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
        linkedList.push(1)
        #expect(!linkedList.isEmpty)
    }
    @Test func linkedList_push() async throws {
        var linkedList = LinkedList<Int>()
        linkedList.push(1)
        #expect(linkedList.first?.value == 1)
        #expect(linkedList.first?.next?.value == nil)
        
        #expect(linkedList.last?.value == 1)
        
        linkedList.push(2)
        #expect(linkedList.first?.value == 2)
        #expect(linkedList.first?.next?.value == 1)
        
        #expect(linkedList.last?.value == 1)
        
        linkedList.push(3)
        #expect(linkedList.first?.value == 3)
        #expect(linkedList.first?.next?.value == 2)
        
        #expect(linkedList.last?.value == 1)
    }
    @Test func linkedList_append() async throws {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        #expect(linkedList.first?.value == 1)
        #expect(linkedList.last?.value == 1)
        linkedList.append(2)
        #expect(linkedList.first?.value == 1)
        #expect(linkedList.last?.value == 2)
        linkedList.append(3)
        #expect(linkedList.first?.value == 1)
        #expect(linkedList.last?.value == 3)
        
        #expect(linkedList.first?.value == 1)
        #expect(linkedList.first?.next?.value == 2)
        #expect(linkedList.first?.next?.next?.value == 3)
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
    
    @Test func linkedList_pop() {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        
        #expect(linkedList.isEmpty == false)
        
        let firstPopNode = linkedList.pop()
        #expect(firstPopNode?.value == 1)
        #expect(linkedList.first?.value == 2)
        
        let secondNode = linkedList.pop()
        #expect(secondNode?.value == 2)
        #expect(linkedList.first?.value == 3)
        
        let thirdNode = linkedList.pop()
        #expect(thirdNode?.value == 3)
        
        #expect(linkedList.isEmpty)
        #expect(linkedList.pop() == nil)
        #expect(linkedList.last == nil)
    }
    
    @Test func linkedList_removeAt() {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        
        
        #expect(linkedList.isEmpty == false)
        
        #expect(linkedList.remove(at: 1)?.value == 2)
        #expect(linkedList.isEmpty == false)
        #expect(linkedList.remove(at: 1)?.value == 3)
        #expect(linkedList.isEmpty == false)
        #expect(linkedList.remove(at: 0)?.value == 1)
    }
    
    
    @Test func linkedList_removeLast() {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        
        #expect(linkedList.isEmpty == false)
        
        let removeLast1 = linkedList.removeLast()
        #expect(removeLast1?.value == 3)
        #expect(linkedList.last?.value == 2)
        
        let removeLast2 = linkedList.removeLast()
        #expect(removeLast2?.value == 2)
        #expect(linkedList.last?.value == 1)
        
        let removeLast3 = linkedList.removeLast()
        #expect(removeLast3?.value == 1)
        #expect(linkedList.isEmpty)
    }
    
    @Test func linkedList_copyOnWrite() {
        var list1 = LinkedList<Int>()
        list1.append(1)
        list1.append(2)
        list1.append(3)
        var list2 = list1
        
        #expect(list1.count == 3)
        #expect(list2.count == 3)
        
        list2.append(4)
        
        #expect(list1.count == 3)
        #expect(list1.last?.value == 3)
        #expect(list2.count == 4)
        #expect(list2.last?.value == 4)
    }
    
    @Test func LRUcache_get() {
        let mockArray = (0...5).map { inter in
            return (inter, "\(inter)")
        }
        
        let cache = LRUCache<Int, String>(size: 6)
        
        #expect(cache.isEmpty)
        #expect(cache.get(1) == nil)
        
        mockArray.forEach { key, value in
            cache.put(key: key, value: value)
        }
        
        #expect(cache.outputOrderList == ["5", "4", "3", "2", "1", "0"])
        #expect(cache.isEmpty == false)
        
        #expect(cache.get(0) == "0")
        #expect(cache.outputOrderList == ["0", "5", "4", "3", "2", "1"])
        #expect(cache.get(3) == "3")
        #expect(cache.outputOrderList == ["3", "0", "5", "4", "2", "1"])
        
        cache.put(key: 3, value: "33")
        #expect(cache.outputOrderList == ["33", "0", "5", "4", "2", "1"])
        
        cache.put(key: 9, value: "9")
        #expect(cache.get(9) == "9")
        #expect(cache.outputOrderList == ["9", "33", "0", "5", "4", "2"])
    }
    @Test func LRUcache_put() {
        let cache = LRUCache<Int, Int>(size: 2)
        
        cache.put(key: 1, value: 1)
        cache.put(key: 2, value: 2)
        #expect(cache.outputOrderList == [2, 1])
        #expect(cache.get(1) == 1)
        #expect(cache.outputOrderList == [1, 2])
        cache.put(key: 3, value: 3)
        #expect(cache.outputOrderList == [3, 1])


        #expect(cache.get(2) == nil) // -1
        #expect(cache.outputOrderList == [3, 1])
        cache.put(key: 4, value: 4)
        #expect(cache.outputOrderList == [4, 3])
        #expect(cache.get(1) == nil)
        #expect(cache.get(3) == 3)
        #expect(cache.outputOrderList == [3, 4])
        #expect(cache.get(4) == 4)
        #expect(cache.outputOrderList == [4, 3])
    }
}
