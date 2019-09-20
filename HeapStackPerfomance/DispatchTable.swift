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

// MARK: - Base Classes

public class BasicClass0 {

    public func baseFunc0() {
        let _ = 0
    }

    public init() {}
}

public class BasicClass1: BasicClass0 {

    public func baseFunc1() {
        let _ = 0
    }
}

public class BasicClass2: BasicClass1 {

    public func baseFunc2() {
        let _ = 0
    }
}

public class BasicClass3: BasicClass2 {

    public func baseFunc3() {
        let _ = 0
    }
}

public class BasicClass4: BasicClass3 {

    public func baseFunc4() {
        let _ = 0
    }
}

public class BasicClass5: BasicClass4 {

    public func baseFunc5() {
        let _ = 0
    }
}

public class BasicClass6: BasicClass5 {

    public func baseFunc6() {
        let _ = 0
    }
}

public class BasicClass7: BasicClass6 {

    public func baseFunc7() {
        let _ = 0
    }
}

public class BasicClass8: BasicClass7 {

    public func baseFunc8() {
        let _ = 0
    }
}

public class BasicClass9: BasicClass8 {

    public func baseFunc9() {
        let _ = 0
    }
}

public class BasicClass10: BasicClass9 {

    public func baseFunc10() {
        let _ = 0
    }
}

public final class BasicClassFinal {

    public func baseFunc() {
        let _ = 0
    }

    public init() {}
}

public final class BasicClassFinal0: BasicClass9 {

    public func baseFunc11() {
        let _ = 0
    }
}

// MARK: - Result Variable's

var parentCallResult: CFAbsoluteTime = 0
var firstSubClassCallResult: CFAbsoluteTime = 0
var lastSubClassCallParentFuncResult: CFAbsoluteTime = 0
var lastSubClassCallSelfFuncResult: CFAbsoluteTime = 0
var finalClassCallSelfResult: CFAbsoluteTime = 0
var finalClassCallParentFuncResult: CFAbsoluteTime = 0

// MARK: - Test

func testDispatchTable() {
    for _ in 0..<100 {
        startTest()
    }

    print("Parent Call His Func - \(parentCallResult/100)")
    print("First Subclass Call Parent Func - \(firstSubClassCallResult/100)")
    print("Last Subclass Call Parent Func - \(lastSubClassCallParentFuncResult/100)")
    print("Last Subclass Call Self Func - \(lastSubClassCallSelfFuncResult/100)")
    print("Final class call self func - \(finalClassCallSelfResult/100)")
    print("Final class call parent func - \(finalClassCallParentFuncResult/100)")
}

private func startTest() {

    let tf = TimeSpender()
    tf.start()
    for _ in 0...1_000_000 {
        let generalParent = BasicClass0()
        generalParent.baseFunc0()
    }
    parentCallResult += tf.finish("Parent Call")

    sleep(1)

    tf.start()
    for _ in 0...1_000_000 {
        let firstsubClass = BasicClass1()
        firstsubClass.baseFunc0()
    }
    firstSubClassCallResult += tf.finish("first subclass call parent func")

    sleep(1)

    tf.start()
    for _ in 0...1_000_000 {
        let lastsubClass = BasicClass10()
        lastsubClass.baseFunc0()
    }
    lastSubClassCallParentFuncResult += tf.finish("last subclass call parent func")

    sleep(1)

    tf.start()
    for _ in 0...1_000_000 {
        let lastsubClass = BasicClass10()
        lastsubClass.baseFunc10()
    }
    lastSubClassCallSelfFuncResult += tf.finish("last subclass call self func")

    sleep(1)

    tf.start()
    for _ in 0...1_000_000 {
        let finalizeClass = BasicClassFinal()
        finalizeClass.baseFunc()
    }
    finalClassCallSelfResult += tf.finish("finalize class call self func")

    sleep(1)

    tf.start()
    for _ in 0...1_000_000 {
        let finalizeClass = BasicClassFinal0()
        finalizeClass.baseFunc11()
    }
    finalClassCallParentFuncResult += tf.finish("finalize class with class hierarchy call self func")

    sleep(1)
}
