//
//  ClassArrayVSStructArray.swift
//  HeapStackPerfomance
//
//  Created by Анатолий on 16/09/2019.
//  Copyright © 2019 Anatoliy. All rights reserved.
//

import Foundation

// Тестируем:
// - вызов элементов массива у структуры/класса/final класса

struct StructArrayEntity {
    var value = 10
}

class ClassArrayEntity {
    var value = 10
}

final class FinalClassArrayEntity {
    var value = 10
}

func testClassArrayVsStructArray() {
    let testArrayStruct = Array(repeating: StructArrayEntity(), count: 1_000_000)
    let testArrayClass = Array(repeating: ClassArrayEntity(), count: 1_000_000)
    let testArrayFinalClass = Array(repeating: FinalClassArrayEntity(), count: 1_000_000)

    let ts = TimeSpender()

    ts.start()
    for i in testArrayStruct {
        let _ = i
    }
    ts.finish("test Array Struct")

    ts.start()
    for i in testArrayClass {
        let _ = i
    }
    ts.finish("test Array Class")

    ts.start()
    for i in testArrayFinalClass {
        let _ = i
    }
    ts.finish("test Array Final Class")
}
