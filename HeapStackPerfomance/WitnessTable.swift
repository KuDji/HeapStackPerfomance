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

// MARK: - Helper struct

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

// MARK: - Result Variable's

private var firArrayResult: CFAbsoluteTime = 0
private var stillFitArrayResult: CFAbsoluteTime = 0
private var notFitArrayResult: CFAbsoluteTime = 0

// MARK: - Test

func witnessTest() {
    for _ in 0..<100 {
        startTest()
    }

    print("Fir Array - \(firArrayResult/100)")
    print("Still Fir Array - \(stillFitArrayResult/100)")
    print("Not Fir Array - \(notFitArrayResult/100)")
}

private func startTest() {

    let witnessArrayFit0: Array<FitnessStruct> = Array(repeating: FitStruct0(), count: 1_000_000)

    let tf = TimeSpender()
    tf.start()
    for i in 0..<1_000_000 {
        let _ = witnessArrayFit0[i].value0
    }
    firArrayResult += tf.finish("Fit array")

    let witnessArrayFit1: Array<FitnessStruct> = Array(repeating: FitStruct1(), count: 1_000_000)

    sleep(1)

    tf.start()
    for i in 0..<1_000_000 {
        let _ = witnessArrayFit1[i].value0
    }
    stillFitArrayResult += tf.finish("Still Fit array")

    let witnessArrayNotFit: Array<FitnessStruct> = Array(repeating: NotFitStruct(), count: 1_000_000)

    sleep(1)

    tf.start()
    for i in 0..<1_000_000 {
        let _ = witnessArrayNotFit[i].value0
    }
    notFitArrayResult += tf.finish("Not Fit array")

    sleep(1)
}
