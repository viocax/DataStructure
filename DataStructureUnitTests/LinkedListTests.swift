//
//  LinkedListTests.swift
//  DataStructureUnitTests
//
//  Created by Jie liang Huang on 2021/3/22.
//

import XCTest

class LinkedListTests: XCTestCase {

    func test_linkedList_node_init() {
        let node: Node<Int> = .init(1)
        XCTAssertEqual(node.value, 1)

        let node1: Node<Int> = .init(3, next: Node(2, next: node))
        XCTAssertEqual(node1.next?.next, node)
        XCTAssertEqual(node1.description, "3.2.1")
    }

    func test_linkedList_init() {
        var list: LinkedList<Int> = .init()
        XCTAssertEqual(list.head, nil)
        XCTAssertEqual(list.tail, nil)
        XCTAssertEqual(list.isEmpty, true)

        list.push(1)
        list.push(2)
        list.push(3)
        list.push(4)
        XCTAssertEqual(list.description, "4.3.2.1")
        XCTAssertEqual(list.head?.value, 4)
        XCTAssertEqual(list.tail?.value, 1)
        
        list.append(5)
        list.append(6)
        XCTAssertEqual(list.description, "4.3.2.1.5.6")
        XCTAssertEqual(list.head?.value, 4)
        XCTAssertEqual(list.tail?.value, 6)

        list.pop()
        XCTAssertEqual(list.description, "3.2.1.5.6")
        XCTAssertEqual(list.head?.value, 3)
        XCTAssertEqual(list.tail?.value, 6)

        list.pop()
        list.pop()
        XCTAssertEqual(list.description, "1.5.6")
        list.pop()
        list.pop()
        list.pop()
        XCTAssertEqual(list.description, "")
        XCTAssertEqual(list.head?.value, nil)
        XCTAssertEqual(list.tail?.value, nil)
    }
}

