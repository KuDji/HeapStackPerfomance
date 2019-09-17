//
//  Array.swift
//  CodePerfomance
//
//  Created by Анатолий on 16/09/2019.
//  Copyright © 2019 Anatoliy. All rights reserved.
//

import Foundation

// MARK: - ContiguousArray vs Array

// Тестируем:
// - скорость вызова функций принимающий массив
// - добавлени данных в массив
// - удаление данных из массива
// - доступ к данным из массива

private class ArrayTestClass {
    var testString = "1234567890"
}

func contiguousArrayTest() {
    let times = TimeSpender()
    var contiguousArray = ContiguousArray(repeating: ArrayTestClass(), count: 1_000_000)

    // Вызов
    times.start()
    contiguousCall(contiguousArray)
    times.finish("contiguous call time")

    // Вызов Inline
    times.start()
    contiguousCallInline(contiguousArray)
    times.finish("contiguous call Inline time")

    // Удаление
    times.start()
    for _ in 0..<contiguousArray.count {
        contiguousArray.removeLast()
    }
    times.finish("contiguous array delete")

    // Добавление
    times.start()
    for i in 0...1_000_000 {
        contiguousArray.append(ArrayTestClass.init())
    }
    times.finish("contiguous array append")

    times.start()
    for i in 0..<contiguousArray.count {
        let _ = contiguousArray[i]
    }
    times.finish("contiguous array access")
}

func regularArrayTest() {
    let times = TimeSpender()
    var regularArray = Array(repeating: ArrayTestClass(), count: 1_000_000)

    // Вызов быстрее каждый раз цифры сильно отличаются
    times.start()
    regularCall(regularArray)
    times.finish("regular call time")

    // Вызов одинаков
    times.start()
    regularCallInline(regularArray)
    times.finish("regular call Inline time")

    // Удаление медленнее почти в 2 раза
    times.start()
    for _ in 0..<regularArray.count {
        regularArray.removeLast()
    }
    times.finish("regular array delete")

    // Добавление почти в 2 раза быстрее
    times.start()
    for i in 0...1_000_000 {
        regularArray.append(ArrayTestClass.init())
    }
    times.finish("regular array append")

    // Доступ быстрее почти в 1.5 раза
    times.start()
    for i in 0..<regularArray.count {
        let _ = regularArray[i]
    }
    times.finish("regular array access")
}

/*
func contiguousArrayTest() {
    let times = TimeSpender()
    var contiguousArray = ContiguousArray(repeating: 10, count: 1_000_000)

    // Вызов
    times.start()
    contiguousCall(contiguousArray)
    times.finish("contiguous call time")

    // Вызов Inline
    times.start()
    contiguousCallInline(contiguousArray)
    times.finish("contiguous call Inline time")

    // Удаление
    times.start()
    for _ in 0..<contiguousArray.count {
        contiguousArray.removeLast()
    }
    times.finish("contiguous array delete")

    // Добавление
    times.start()
    for i in 0...1_000_000 {
        contiguousArray.append(i)
    }
    times.finish("contiguous array append")

    times.start()
    for i in 0..<contiguousArray.count {
        let _ = contiguousArray[i]
    }
    times.finish("contiguous array access")
}

func regularArrayTest() {
    let times = TimeSpender()
    var regularArray = Array(repeating: 10, count: 1_000_000)

    // Вызов быстрее каждый раз цифры сильно отличаются
    times.start()
    regularCall(regularArray)
    times.finish("regular call time")

    // Вызов одинаков
    times.start()
    regularCallInline(regularArray)
    times.finish("regular call Inline time")

    // Удаление медленнее почти в 2 раза
    times.start()
    for _ in 0..<regularArray.count {
        regularArray.removeLast()
    }
    times.finish("regular array delete")

    // Добавление почти в 2 раза быстрее
    times.start()
    for i in 0...1_000_000 {
        regularArray.append(i)
    }
    times.finish("regular array append")

    // Доступ быстрее почти в 1.5 раза
    times.start()
    for i in 0..<regularArray.count {
        let _ = regularArray[i]
    }
    times.finish("regular array access")
}

@inline(never)
private func contiguousCall(_ value: ContiguousArray<Int>) {
    let _ = value[0]
}

@inline(never)
private func regularCall(_ value: [Int]) {
    let _ = value[0]
}

private func contiguousCallInline(_ value: ContiguousArray<Int>) {
    let _ = value[0]
}

private func regularCallInline(_ value: [Int]) {
    let _ = value[0]
}

 */

@inline(never)
private func contiguousCall(_ value: ContiguousArray<ArrayTestClass>) {
    let _ = value[0]
}

@inline(never)
private func regularCall(_ value: [ArrayTestClass]) {
    let _ = value[0]
}

private func contiguousCallInline(_ value: ContiguousArray<ArrayTestClass>) {
    let _ = value[0]
}

private func regularCallInline(_ value: [ArrayTestClass]) {
    let _ = value[0]
}
