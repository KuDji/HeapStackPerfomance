//
//  GenericTest.swift
//  HeapStackPerfomance
//
//  Created by Анатолий on 17/09/2019.
//  Copyright © 2019 Anatoliy. All rights reserved.
//

import Foundation

// Тестируем:
// - сравнение функции принимающей протокол и generic функции
// - сравнение скорость вызова функций generic и протокол на массиве основном на общем протоколе

// MARK: - Helper struct

private protocol BasicGeneric {
    func draw()
}

private struct DrawPoint: BasicGeneric {
    var x: Int
    var y: Int

    func draw() {
        let _ = x
        let _ = y
    }
}

private struct DrawSquare: BasicGeneric {
    var width: Int
    var height: Int

    func draw() {
        let _ = width
        let _ = height
    }
}

// MARK: - Tested Func

private func genericTest <T: BasicGeneric>(object: T) {
    object.draw()
}

private func protocolTest(object: BasicGeneric) {
    object.draw()
}

// MARK: - Result Var's

private var genericResult: CFAbsoluteTime = 0
private var protocolResult: CFAbsoluteTime = 0
private var genericArrayResult: CFAbsoluteTime = 0
private var protocolArrayResult: CFAbsoluteTime = 0

// MARK: - API

func genericTestStart() {
    for _ in 0..<100 {
        startTest()
    }

    print("Generic func test = \(genericResult/100)")
    print("Protocol func test = \(protocolResult/100)")
    print("Generic Array func test = \(genericArrayResult/100)")
    print("Protocol Array func test = \(protocolArrayResult/100)")
}

private func startTest() {
    let pointObject = DrawPoint(x: 3, y: 3)
    let squareObject = DrawSquare(width: 3, height: 3)

    // Homogeneous test

    let ts = TimeSpender()
    ts.start()
    for _ in 0...1_000_000 {
        genericTest(object: pointObject)
    }
    genericResult += ts.finish("Generic Test")

    sleep(1)

    ts.start()
    for _ in 0...1_000_000 {
        protocolTest(object: pointObject)
    }
    protocolResult += ts.finish("Protocol Test")

    // Geterogeneous test

    var arrayOfPoints: Array<BasicGeneric> = []

    for _ in 0...500_000 {
        arrayOfPoints.append(pointObject)
    }
    for _ in 0...500_000 {
        arrayOfPoints.append(squareObject)
    }

    sleep(1)

    ts.start()
    for i in 0..<arrayOfPoints.count {
        protocolTest(object: arrayOfPoints[i])
    }
    genericArrayResult += ts.finish("Protocol Array Test")

    sleep(1)

    ts.start()
    for i in 0..<arrayOfPoints.count {
        if let object = arrayOfPoints[i] as? DrawPoint {
            genericTest(object: object)
        } else if let object = arrayOfPoints[i] as? DrawSquare {
            genericTest(object: object)
        } else {
            assert(false, "Cannot case object to BasicGeneric Protocol")
        }
    }
    protocolArrayResult += ts.finish("Generic Array Test")

    sleep(1)
}
