//
//  Array.swift
//  CodePerfomance
//
//  Created by Анатолий on 16/09/2019.
//  Copyright © 2019 Anatoliy. All rights reserved.
//

import Foundation

// MARK: - Desription

// Тестируем:
// - скорость вызова функций принимающий массив
// - добавлени данных в массив
// - удаление данных из массива
// - доступ к данным из массива

// MARK: - Helper struct's

private class ArrayTestClassReference {
    var testString: String

    init(_ str: String) {
        self.testString = str
    }
}

private struct ArrayTestStructReference {
    var testString: String
}

private class ArrayTestClassValue {
    var testValue: Double

    init(_ value: Double) {
        self.testValue = value
    }
}

private struct ArrayTestStructValue {
    var testValue: Double
}

// MARK: - Statistic Variable Buffer

private var result = ContiguessVSArrayResult()

// MARK: - Test Enter Point

func arrayTest() {
    for _ in 0..<10 {
        startTest()
    }
    result.printAverageResults()
}

private func startTest() {

    // Create Value's
    let ts = TimeSpender()

    // MARK: - ContiguousArray Based Type
    var contiguousClassRef = ContiguousArray(repeating: ArrayTestClassReference("1234567890"),
                                             count: 1_000_00)
    var contiguousStructRef = ContiguousArray(repeating: ArrayTestStructReference(testString: "1234567890"),
                                              count: 1_000_00)
    var contiguousClassValue = ContiguousArray(repeating: ArrayTestClassValue(1234567890),
                                               count: 1_000_00)
    var contiguousStructValue = ContiguousArray(repeating: ArrayTestStructValue(testValue: 1234567890),
                                                count: 1_000_00)

    // MARK: - Array Based Type
    var arrayClassRef = Array(repeating: ArrayTestClassReference("1234567890"),
                                   count: 1_000_00)
    var arrayStructRef = Array(repeating: ArrayTestStructReference(testString: "1234567890"),
                                    count: 1_000_00)
    var arrayClassValue = Array(repeating: ArrayTestClassValue(1234567890),
                                     count: 1_000_00)
    var arrayStructValue = Array(repeating: ArrayTestStructValue(testValue: 1234567890),
                                      count: 1_000_00)

    sleep(1)

    // MARK: - Function Call

    print("Вызов функции \n")

    ts.start()
    for _ in 0..<1_000_000 {
        contiguousCallClass(contiguousClassRef)
    }
    result.funcCallContiguousClassRef += ts.finish("ContiguousArray - Class + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_000 {
        contiguousCallClass(contiguousStructRef)
    }
    result.funcCallContiguousStructRef += ts.finish("ContiguousArray - Struct + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_000 {
        contiguousCallClass(contiguousClassValue)
    }
    result.funcCallContiguousClassValue += ts.finish("ContiguousArray - Class + Double")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_000 {
        contiguousCallClass(contiguousStructValue)
    }
    result.funcCallContiguousStructValue += ts.finish("ContiguousArray - Struct + Double")

    sleep(1)
    print("--------------------")

    ts.start()
    for _ in 0..<1_000_000 {
        regularCallClass(arrayClassRef)
    }
    result.funcCallArrayClassRef += ts.finish("Array - Class + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_000 {
        regularCallClass(arrayStructRef)
    }
    result.funcCallArrayStructRef += ts.finish("Array - Struct + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_000 {
        regularCallClass(arrayClassValue)
    }
    result.funcCallArrayClassValue += ts.finish("Array - Class + Double")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_000 {
        regularCallClass(arrayStructValue)
    }
    result.funcCallArrayStructValue += ts.finish("Array - Struct + Double")

    sleep(1)
    print("--------------------")
    print("Вызов функции Inline \n")

    // MARK: - Function Call Inline

    ts.start()
    for _ in 0..<1_000_000 {
        contiguousCallClassInline(contiguousClassRef)
    }
    result.inlineContiguousClassRef += ts.finish("ContiguousArray(Inline) - Class + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_000 {
        contiguousCallClassInline(contiguousStructRef)
    }
    result.inlineContiguousStructRef += ts.finish("ContiguousArray(Inline) - Struct + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_000 {
        contiguousCallClassInline(contiguousClassValue)
    }
    result.inlineContiguousClassValue += ts.finish("ContiguousArray(Inline) - Class + Double")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_000 {
        contiguousCallClassInline(contiguousStructValue)
    }
    result.inlineContiguousStructValue += ts.finish("ContiguousArray(Inline) - Struct + Double")

    sleep(1)
    print("--------------------")

    ts.start()
    for _ in 0..<1_000_000 {
        regularCallClassInline(arrayClassRef)
    }
    result.inlineArrayClassRef += ts.finish("Array(Inline) - Class + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_000 {
        regularCallClassInline(arrayStructRef)
    }
    result.inlineArrayStructRef += ts.finish("Array(Inline) - Struct + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_000 {
        regularCallClassInline(arrayClassValue)
    }
    result.inlineArrayClassValue += ts.finish("Array(Inline) - Class + Double")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_000 {
        regularCallClassInline(arrayStructValue)
    }
    result.inlineArrayStructValue += ts.finish("Array(Inline) - Struct + Double")

    sleep(1)
    print("--------------------")
    print("Удаление объектов \n")

    // MARK: - Delete Object from Array

    ts.start()
    for _ in 0..<1_000_00 {
        contiguousClassRef.removeLast()
    }
    result.deleteContiguousClassRef += ts.finish("ContiguousArray(Delete) - Class + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_00 {
        contiguousStructRef.removeLast()
    }
    result.deleteContiguousStructRef += ts.finish("ContiguousArray(Delete) - Struct + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_00 {
        contiguousClassValue.removeLast()
    }
    result.deleteContiguousClassValue += ts.finish("ContiguousArray(Delete) - Class + Double")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_00 {
        contiguousStructValue.removeLast()
    }
    result.deleteContiguousStructValue += ts.finish("ContiguousArray(Delete) - Struct + Double")

    sleep(1)
    print("--------------------")

    ts.start()
    for _ in 0..<1_000_00 {
        arrayClassRef.removeLast()
    }
    result.deleteArrayClassRef += ts.finish("Array(Delete) - Class + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_00 {
        arrayStructRef.removeLast()
    }
    result.deleteArrayStructRef += ts.finish("Array(Delete) - Struct + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_00 {
        arrayClassValue.removeLast()
    }
    result.deleteArrayClassValue += ts.finish("Array(Delete) - Class + Double")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_00 {
        arrayStructValue.removeLast()
    }
    result.deleteArrayStructValue += ts.finish("Array(Delete) - Struct + Double")

    sleep(1)
    print("--------------------")
    print("Добавление объектов \n")

    // MARK: - Add Object from Array

    ts.start()
    for _ in 0..<1_000_00 {
        contiguousClassRef.append(ArrayTestClassReference("1234567890"))
    }
    result.appendContiguousClassRef += ts.finish("ContiguousArray(Append) - Class + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_00 {
        contiguousStructRef.append(ArrayTestStructReference(testString: "1234567890"))
    }
    result.appendContiguousStructRef += ts.finish("ContiguousArray(Append) - Struct + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_00 {
        contiguousClassValue.append(ArrayTestClassValue(1234567890))
    }
    result.appendContiguousClassValue += ts.finish("ContiguousArray(Append) - Class + Double")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_00 {
        contiguousStructValue.append(ArrayTestStructValue(testValue: 1234567890))
    }
    result.appendContiguousStructValue += ts.finish("ContiguousArray(Append) - Struct + Double")

    sleep(1)
    print("--------------------")

    ts.start()
    for _ in 0..<1_000_00 {
        arrayClassRef.append(ArrayTestClassReference("1234567890"))
    }
    result.appendArrayClassRef += ts.finish("Array(Append) - Class + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_00 {
        arrayStructRef.append(ArrayTestStructReference(testString: "1234567890"))
    }
    result.appendArrayStructRef += ts.finish("Array(Append) - Struct + String")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_00 {
        arrayClassValue.append(ArrayTestClassValue(1234567890))
    }
    result.appendArrayClassValue += ts.finish("Array(Append) - Class + Double")

    sleep(1)

    ts.start()
    for _ in 0..<1_000_00 {
        arrayStructValue.append(ArrayTestStructValue(testValue: 1234567890))
    }
    result.appendArrayStructValue += ts.finish("Array(Append) - Struct + Double")

    sleep(1)
    print("--------------------")
    print("Доступ к объекту \n")

    ts.start()
    for i in contiguousClassRef {
        let _ = i.testString
    }
    result.accessContiguousClassRef += ts.finish("ContiguousArray(Access) - Class + String")

    sleep(1)

    ts.start()
    for i in contiguousStructRef {
        let _ = i.testString
    }
    result.accessContiguousStructRef += ts.finish("ContiguousArray(Access) - Struct + String")

    sleep(1)

    ts.start()
    for i in contiguousClassValue {
        let _ = i.testValue
    }
    result.accessContiguousClassValue += ts.finish("ContiguousArray(Access) - Class + Double")

    sleep(1)

    ts.start()
    for i in contiguousStructValue {
        let _ = i.testValue
    }
    result.accessContiguousStructValue += ts.finish("ContiguousArray(Access) - Struct + Double")

    sleep(1)
    print("--------------------")

    ts.start()
    for i in arrayClassRef {
        let _ = i.testString
    }
    result.accessArrayClassRef += ts.finish("Array(Access) - Class + String")

    sleep(1)

    ts.start()
    for i in arrayStructRef {
        let _ = i.testString
    }
    result.accessArrayStructRef += ts.finish("Array(Access) - Struct + String")

    sleep(1)

    ts.start()
    for i in arrayClassValue {
        let _ = i.testValue
    }
    result.accessArrayClassValue += ts.finish("Array(Access) - Class + Double")

    sleep(1)

    ts.start()
    for i in arrayStructValue {
        let _ = i.testValue
    }
    result.accessArrayStructValue += ts.finish("Array(Access) - Struct + Double")
}

// MARK: - Function Inline - Never

@inline(never)
private func contiguousCallClass(_ value: ContiguousArray<ArrayTestClassReference>) {
    let _ = value[0]
}

@inline(never)
private func contiguousCallClass(_ value: ContiguousArray<ArrayTestStructReference>) {
    let _ = value[0]
}

@inline(never)
private func contiguousCallClass(_ value: ContiguousArray<ArrayTestClassValue>) {
    let _ = value[0]
}

@inline(never)
private func contiguousCallClass(_ value: ContiguousArray<ArrayTestStructValue>) {
    let _ = value[0]
}

@inline(never)
private func regularCallClass(_ value: [ArrayTestClassReference]) {
    let _ = value[0]
}

@inline(never)
private func regularCallClass(_ value: [ArrayTestStructReference]) {
    let _ = value[0]
}

@inline(never)
private func regularCallClass(_ value: [ArrayTestClassValue]) {
    let _ = value[0]
}

@inline(never)
private func regularCallClass(_ value: [ArrayTestStructValue]) {
    let _ = value[0]
}

// MARK: - Function Inline

private func contiguousCallClassInline(_ value: ContiguousArray<ArrayTestClassReference>) {
    let _ = value[0]
}

private func contiguousCallClassInline(_ value: ContiguousArray<ArrayTestStructReference>) {
    let _ = value[0]
}

private func contiguousCallClassInline(_ value: ContiguousArray<ArrayTestClassValue>) {
    let _ = value[0]
}

private func contiguousCallClassInline(_ value: ContiguousArray<ArrayTestStructValue>) {
    let _ = value[0]
}

private func regularCallClassInline(_ value: [ArrayTestClassReference]) {
    let _ = value[0]
}

private func regularCallClassInline(_ value: [ArrayTestStructReference]) {
    let _ = value[0]
}

private func regularCallClassInline(_ value: [ArrayTestClassValue]) {
    let _ = value[0]
}

private func regularCallClassInline(_ value: [ArrayTestStructValue]) {
    let _ = value[0]
}

