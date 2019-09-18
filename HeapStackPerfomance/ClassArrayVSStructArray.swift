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

private var arrayStructResult: CFAbsoluteTime = 0
private var arrayClassResult: CFAbsoluteTime = 0
private var arrayFinalClassResult: CFAbsoluteTime = 0

func testClassArrayVsStructArray() {
    for _ in 0..<100 {
        testStart()
    }

    print("Access to Struct Property - \(arrayStructResult/100)")
    print("Access to Class Property - \(arrayClassResult/100)")
    print("Access to Final Class Property - \(arrayFinalClassResult/100)")
}

private func testStart() {
    let testArrayStruct = Array(repeating: StructArrayEntity(), count: 1_000_000)
    let testArrayClass = Array(repeating: ClassArrayEntity(), count: 1_000_000)
    let testArrayFinalClass = Array(repeating: FinalClassArrayEntity(), count: 1_000_000)

    let ts = TimeSpender()

    ts.start()
    for i in testArrayStruct {
        let _ = i
    }
    arrayStructResult += ts.finish("test Array Struct")

    ts.start()
    for i in testArrayClass {
        let _ = i
    }
    arrayClassResult += ts.finish("test Array Class")

    ts.start()
    for i in testArrayFinalClass {
        let _ = i
    }
    arrayFinalClassResult += ts.finish("test Array Final Class")
}
