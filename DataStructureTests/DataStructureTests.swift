//
//  DataStructureTests.swift
//  DataStructureTests
//
//  Created by drake on 2024/8/19.
//

import Testing
@testable import DataStructure

struct DataStructureTests {

    @Test func stack_int() async throws {
        var stack = Stack<Int>()

        #expect(stack.count == .zero)
        #expect(stack.isEmpty)

        stack.push(2)
        #expect(stack.peek() == 2)
        stack.push(3)
        #expect(stack.peek() == 3)
        #expect(stack.isEmpty == false)
    }
}
