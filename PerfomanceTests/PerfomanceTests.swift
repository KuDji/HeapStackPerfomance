//
//  PerfomanceTests.swift
//  PerfomanceTests
//
//  Created by Анатолий on 20/09/2019.
//  Copyright © 2019 Anatoliy. All rights reserved.
//

import XCTest
import HeapStackPerfomance

class PerfomanceTests: XCTestCase {

    override func setUp() {}

    override func tearDown() {}

    // Проба теста через XCTest measure
    // Результат - погрешность слишком высокая
    // в пермом тесте результат от 0.86 до 0.98
    // слишком большой разброс для установления закономерности
    // P.S.: Мне интересна разница в 10...100...1000 раз
    // поэтому оставим тесты в коде как есть без использования XCTest

    func testPerfomanceDispatchTable0() {
        measure {
            for _ in 0...1_000_000 {
                let generalParent = BasicClass0()
                generalParent.baseFunc0()
            }
        }
    }

    func testPerfomanceDispatchTable1() {
        measure {
            for _ in 0...1_000_000 {
                let firstsubClass = BasicClass1()
                firstsubClass.baseFunc0()
            }
        }
    }

    func testPerfomanceDispatchTable2() {
        measure {
            for _ in 0...1_000_000 {
                let lastsubClass = BasicClass10()
                lastsubClass.baseFunc0()
            }
        }
    }

    func testPerfomanceDispatchTable3() {
        measure {
            for _ in 0...1_000_000 {
                let lastsubClass = BasicClass10()
                lastsubClass.baseFunc10()
            }
        }
    }

    func testPerfomanceDispatchTable4() {
        measure {
            for _ in 0...1_000_000 {
                let finalizeClass = BasicClassFinal()
                finalizeClass.baseFunc()
            }
        }
    }

    func testPerfomanceDispatchTable5() {
        measure {
            for _ in 0...1_000_000 {
                let finalizeClass = BasicClassFinal0()
                finalizeClass.baseFunc11()
            }
        }
    }
}
