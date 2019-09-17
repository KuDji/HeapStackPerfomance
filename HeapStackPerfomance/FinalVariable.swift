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

func testFinalVariable() {

    let testClass = AbstractClass()

    let tf = TimeSpender()
    tf.start()
    for _ in 0..<1_000_000 {
        let _ = testClass.value0
    }
    tf.finish("dispatched variable")

    tf.start()
    for _ in 0..<1_000_000 {
        let _ = testClass.value19
    }
    tf.finish("final variable")
}
