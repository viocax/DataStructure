//
//  StackTests.swift
//  StackTests
//
//  Created by Jie liang Huang on 2021/3/19.
//

import XCTest
@testable import DataStructure

class StackTests: XCTestCase {
    func test_stack_init_order() {
        let stack: Stack<Int> = [1, 2, 4, 5, 6, 7]
        XCTAssertEqual(stack.sequence, [7, 6, 5, 4, 2, 1])
    }
    func test_stack_push_order() {
        let stub_Array = [1, 2, 4, 5, 6, 7]
        var stack = Stack<Int>()
        stub_Array.forEach { (value) in
            stack.push(value)
        }
        XCTAssertEqual(stack.sequence, [7, 6, 5, 4, 2, 1])
    }
    func test_stack_pop_order() {
        var stack: Stack<Int> = [1, 2, 4, 5, 6, 7]
        XCTAssertEqual(stack.pop(), 7)
        XCTAssertEqual(stack.pop(), 6)
        XCTAssertEqual(stack.pop(), 5)
        XCTAssertEqual(stack.pop(), 4)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.pop(), 1)
        XCTAssertEqual(stack.sequence, [])
    }
    func test_stack_isEmpty() {

        var stack = Stack<Int>()
        XCTAssertEqual(stack.isEmpty, true)

        let stub_Array = [1, 2, 4, 5, 6, 7]
        stub_Array.forEach { (value) in
            stack.push(value)
        }
        XCTAssertEqual(stack.isEmpty, false)
    }
}
