//
//  WitnessTable.swift
//  HeapStackPerfomance
//
//  Created by Анатолий on 17/09/2019.
//  Copyright © 2019 Anatoliy. All rights reserved.
//

import Foundation

// Тестируем:
// - скорость работы witness table
// которая в условиях хранения объекта в массиве создает
// объект хранящий 3 блока по 8 бит для данных
// либо ссылку на объект в памяти

private protocol FitnessStruct {
    var value0: Double { get set }
}

private struct FitStruct0: FitnessStruct {

    var value0 = 10.2
}

private struct FitStruct1: FitnessStruct {

    var value0 = 10.2
    var value1 = 10.2
    var value2 = 10.2
}

private struct NotFitStruct: FitnessStruct {

    var value0 = 10.2
    var value1 = 10.2
    var value2 = 10.2
    var value3 = 10.2
    var value4 = 10.2
    var value5 = 10.2
}

func witnessTest() {

    let witnessArrayFit0: Array<FitnessStruct> = Array(repeating: FitStruct0(), count: 1_000_000)

    let tf = TimeSpender()
    tf.start()
    for i in 0..<1_000_000 {
        let _ = witnessArrayFit0[i].value0
    }
    tf.finish("Fit array")

    let witnessArrayFit1: Array<FitnessStruct> = Array(repeating: FitStruct1(), count: 1_000_000)

    sleep(1)

    tf.start()
    for i in 0..<1_000_000 {
        let _ = witnessArrayFit1[i].value0
    }
    tf.finish("Still Fit array")

    let witnessArrayNotFit: Array<FitnessStruct> = Array(repeating: NotFitStruct(), count: 1_000_000)

    sleep(1)

    tf.start()
    for i in 0..<1_000_000 {
        let _ = witnessArrayNotFit[i].value0
    }
    tf.finish("Not Fit array")
}
