//
//  DispatchTable.swift
//  HeapStackPerfomance
//
//  Created by Анатолий on 17/09/2019.
//  Copyright © 2019 Anatoliy. All rights reserved.
//

import Foundation

// Тестируем:
// - скорость вызова функции через
// таблицу диспетчеризации
// для final класса
// для final класса который имеет несколько предков
// и так же имеет таблицу диспетчеризации

private class BasicClass0 {

    func baseFunc0() {
        let _ = 0
    }
}

private class BasicClass1: BasicClass0 {

    func baseFunc1() {
        let _ = 0
    }
}

private class BasicClass2: BasicClass1 {

    func baseFunc2() {
        let _ = 0
    }
}

private class BasicClass3: BasicClass2 {

    func baseFunc3() {
        let _ = 0
    }
}

private class BasicClass4: BasicClass3 {

    func baseFunc4() {
        let _ = 0
    }
}

private class BasicClass5: BasicClass4 {

    func baseFunc5() {
        let _ = 0
    }
}

private class BasicClass6: BasicClass5 {

    func baseFunc6() {
        let _ = 0
    }
}

private class BasicClass7: BasicClass6 {

    func baseFunc7() {
        let _ = 0
    }
}

private class BasicClass8: BasicClass7 {

    func baseFunc8() {
        let _ = 0
    }
}

private class BasicClass9: BasicClass8 {

    func baseFunc9() {
        let _ = 0
    }
}

private class BasicClass10: BasicClass9 {

    func baseFunc10() {
        let _ = 0
    }
}

private final class BasicClassFinal {

    func baseFunc() {
        let _ = 0
    }
}

private final class BasicClassFinal0: BasicClass9 {

    func baseFunc11() {
        let _ = 0
    }
}

func testDispatchTable() {

    let tf = TimeSpender()
    tf.start()
    for _ in 0...1_000_000 {
        let generalParent = BasicClass0()
        generalParent.baseFunc0()
    }
    tf.finish("Parent Call")

    tf.start()
    for _ in 0...1_000_000 {
        let firstsubClass = BasicClass1()
        firstsubClass.baseFunc0()
    }
    tf.finish("first subclass call parent func")

    tf.start()
    for _ in 0...1_000_000 {
        let lastsubClass = BasicClass10()
        lastsubClass.baseFunc0()
    }
    tf.finish("last subclass call parent func")

    tf.start()
    for _ in 0...1_000_000 {
        let lastsubClass = BasicClass10()
        lastsubClass.baseFunc10()
    }
    tf.finish("last subclass call self func")

    tf.start()
    for _ in 0...1_000_000 {
        let finalizeClass = BasicClassFinal()
        finalizeClass.baseFunc()
    }
    tf.finish("finalize class call self func")

    tf.start()
    for _ in 0...1_000_000 {
        let finalizeClass = BasicClassFinal0()
        finalizeClass.baseFunc11()
    }
    tf.finish("finalize class with classs hierarchy call self func")
}
