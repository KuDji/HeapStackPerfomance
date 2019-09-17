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

private func genericTest <T: BasicGeneric>(object: T) {
    object.draw()
}

private func protocolTest(object: BasicGeneric) {
    object.draw()
}

func genericTestStart() {
    let pointObject = DrawPoint(x: 3, y: 3)
    let squareObject = DrawSquare(width: 3, height: 3)

    // Homogeneous test

    let ts = TimeSpender()
    ts.start()
    for _ in 0...1_000_000 {
        genericTest(object: pointObject)
    }
    ts.finish("Generic Test")

    ts.start()
    for _ in 0...1_000_000 {
        protocolTest(object: pointObject)
    }
    ts.finish("Protocol Test")

    // Geterogeneous test

    var arrayOfPoints: Array<BasicGeneric> = []

    for _ in 0...500_000 {
        arrayOfPoints.append(pointObject)
    }
    for _ in 0...500_000 {
        arrayOfPoints.append(squareObject)
    }

    ts.start()
    for i in 0..<arrayOfPoints.count {
        protocolTest(object: arrayOfPoints[i])
    }
    ts.finish("Protocol Array Test")

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
    ts.finish("Generic Array Test")
}
