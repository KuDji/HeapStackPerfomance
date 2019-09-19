//
//  FinalVariable.swift
//  HeapStackPerfomance
//
//  Created by Анатолий on 17/09/2019.
//  Copyright © 2019 Anatoliy. All rights reserved.
//

import Foundation

// Тестируем:
// - скорость вызова обычной переменной класса и с модификатором final

// MARK: - Helper Struct

private class AbstractClass {

    var value0 = 101
    var value1 = 102
    var value2 = 103
    var value3 = 104
    var value4 = 105
    var value5 = 106
    var value6 = 107
    var value7 = 108
    var value8 = 109
    var value9 = 110
    var value10 = 111
    var value11 = 112
    var value12 = 113
    var value13 = 114
    var value14 = 115
    var value15 = 116
    var value16 = 117
    var value17 = 118
    var value18 = 119
    final var value19 = 120
}

// MARK: - Result Variable's

private var dispatchVarResult: CFAbsoluteTime = 0
private var finalVarResult: CFAbsoluteTime = 0
private var dispatchVarPreInitResult: CFAbsoluteTime = 0
private var finalVarPreInitResult: CFAbsoluteTime = 0

// MARK: - Test

func testFinalVariable() {
    for _ in 0..<100 {
        startTest()
    }
    for _ in 0..<100 {
        startTestPreInit()
    }

    print("Dispatched Var - \(dispatchVarResult/100)")
    print("Final Var - \(finalVarResult/100)")
    print("---------------")
    print("Dispatched Var Only One Object Created - \(dispatchVarPreInitResult/100)")
    print("Final Var Only One Object Created - \(finalVarPreInitResult/100)")
}

private func startTestPreInit() {

    let testClass = AbstractClass()

    let tf = TimeSpender()
    tf.start()
    for _ in 0..<1_000_00 {
        let _ = testClass.value0
    }
    dispatchVarPreInitResult += tf.finish("dispatched variable")

    sleep(1)

    tf.start()
    for _ in 0..<1_000_00 {
        let _ = testClass.value19
    }
    finalVarPreInitResult += tf.finish("final variable")

    sleep(1)
}

private func startTest() {

    let tf = TimeSpender()
    tf.start()
    for _ in 0..<1_000_00 {
        let testClass = AbstractClass()
        let _ = testClass.value0
    }
    dispatchVarResult += tf.finish("dispatched variable")

    sleep(1)

    tf.start()
    for _ in 0..<1_000_00 {
        let testClass = AbstractClass()
        let _ = testClass.value19
    }
    finalVarResult += tf.finish("final variable")

    sleep(1)
}
