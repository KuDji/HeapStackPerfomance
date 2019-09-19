//
//  ContiguessVSArrayResult.swift
//  HeapStackPerfomance
//
//  Created by Анатолий on 18/09/1019.
//  Copyright © 1019 Anatoliy. All rights reserved.
//

import Foundation

struct ContiguessVSArrayResult {

    // MARK: - Func Call Result

    var funcCallContiguousClassRef: CFAbsoluteTime = 0
    var funcCallContiguousStructRef: CFAbsoluteTime = 0
    var funcCallContiguousClassValue: CFAbsoluteTime = 0
    var funcCallContiguousStructValue: CFAbsoluteTime = 0
    var funcCallArrayClassRef: CFAbsoluteTime = 0
    var funcCallArrayStructRef: CFAbsoluteTime = 0
    var funcCallArrayClassValue: CFAbsoluteTime = 0
    var funcCallArrayStructValue: CFAbsoluteTime = 0

    // MARK: - Func Inline Call Result

    var inlineContiguousClassRef: CFAbsoluteTime = 0
    var inlineContiguousStructRef: CFAbsoluteTime = 0
    var inlineContiguousClassValue: CFAbsoluteTime = 0
    var inlineContiguousStructValue: CFAbsoluteTime = 0
    var inlineArrayClassRef: CFAbsoluteTime = 0
    var inlineArrayStructRef: CFAbsoluteTime = 0
    var inlineArrayClassValue: CFAbsoluteTime = 0
    var inlineArrayStructValue: CFAbsoluteTime = 0

    // MARK: - Delete Result

    var deleteContiguousClassRef: CFAbsoluteTime = 0
    var deleteContiguousStructRef: CFAbsoluteTime = 0
    var deleteContiguousClassValue: CFAbsoluteTime = 0
    var deleteContiguousStructValue: CFAbsoluteTime = 0
    var deleteArrayClassRef: CFAbsoluteTime = 0
    var deleteArrayStructRef: CFAbsoluteTime = 0
    var deleteArrayClassValue: CFAbsoluteTime = 0
    var deleteArrayStructValue: CFAbsoluteTime = 0

    // MARK: - Append Result

    var appendContiguousClassRef: CFAbsoluteTime = 0
    var appendContiguousStructRef: CFAbsoluteTime = 0
    var appendContiguousClassValue: CFAbsoluteTime = 0
    var appendContiguousStructValue: CFAbsoluteTime = 0
    var appendArrayClassRef: CFAbsoluteTime = 0
    var appendArrayStructRef: CFAbsoluteTime = 0
    var appendArrayClassValue: CFAbsoluteTime = 0
    var appendArrayStructValue: CFAbsoluteTime = 0

    // MARK: - Access Result

    var accessContiguousClassRef: CFAbsoluteTime = 0
    var accessContiguousStructRef: CFAbsoluteTime = 0
    var accessContiguousClassValue: CFAbsoluteTime = 0
    var accessContiguousStructValue: CFAbsoluteTime = 0
    var accessArrayClassRef: CFAbsoluteTime = 0
    var accessArrayStructRef: CFAbsoluteTime = 0
    var accessArrayClassValue: CFAbsoluteTime = 0
    var accessArrayStructValue: CFAbsoluteTime = 0

    func printAverageResults() {

        print("funcCallContiguousClassRef - \(funcCallContiguousClassRef/10)")
        print("funcCallContiguousStructRef - \(funcCallContiguousStructRef/10)")
        print("funcCallContiguousClassValue - \(funcCallContiguousClassValue/10)")
        print("funcCallContiguousStructValue - \(funcCallContiguousStructValue/10)")
        print("funcCallArrayClassRef - \(funcCallArrayClassRef/10)")
        print("funcCallArrayStructRef - \(funcCallArrayStructRef/10)")
        print("funcCallArrayClassValue - \(funcCallArrayClassValue/10)")
        print("funcCallArrayStructValue - \(funcCallArrayStructValue/10)")

        print("----------")

        print("inlineContiguousClassRef - \(inlineContiguousClassRef/10)")
        print("inlineContiguousStructRef - \(inlineContiguousStructRef/10)")
        print("inlineContiguousClassValue - \(inlineContiguousClassValue/10)")
        print("inlineContiguousStructValue - \(inlineContiguousStructValue/10)")
        print("inlineArrayClassRef - \(inlineArrayClassRef/10)")
        print("inlineArrayStructRef - \(inlineArrayStructRef/10)")
        print("inlineArrayClassValue - \(inlineArrayClassValue/10)")
        print("inlineArrayStructValue - \(inlineArrayStructValue/10)")

        print("----------")

        print("deleteContiguousClassRef - \(deleteContiguousClassRef/10)")
        print("deleteContiguousStructRef - \(deleteContiguousStructRef/10)")
        print("deleteContiguousClassValue - \(deleteContiguousClassValue/10)")
        print("deleteContiguousStructValue - \(deleteContiguousStructValue/10)")
        print("deleteArrayClassRef - \(deleteArrayClassRef/10)")
        print("deleteArrayStructRef - \(deleteArrayStructRef/10)")
        print("deleteArrayClassValue - \(deleteArrayClassValue/10)")
        print("deleteArrayStructValue - \(deleteArrayStructValue/10)")

        print("----------")

        print("appendContiguousClassRef - \(appendContiguousClassRef/10)")
        print("appendContiguousStructRef - \(appendContiguousStructRef/10)")
        print("appendContiguousClassValue - \(appendContiguousClassValue/10)")
        print("appendContiguousStructValue - \(appendContiguousStructValue/10)")
        print("appendArrayClassRef - \(appendArrayClassRef/10)")
        print("appendArrayStructRef - \(appendArrayStructRef/10)")
        print("appendArrayClassValue - \(appendArrayClassValue/10)")
        print("appendArrayStructValue - \(appendArrayStructValue/10)")

        print("----------")

        print("accessContiguousClassRef - \(accessContiguousClassRef/10)")
        print("accessContiguousStructRef - \(accessContiguousStructRef/10)")
        print("accessContiguousClassValue - \(accessContiguousClassValue/10)")
        print("accessContiguousStructValue - \(accessContiguousStructValue/10)")
        print("accessArrayClassRef - \(accessArrayClassRef/10)")
        print("accessArrayStructRef - \(accessArrayStructRef/10)")
        print("accessArrayClassValue - \(accessArrayClassValue/10)")
        print("accessArrayStructValue - \(accessArrayStructValue/10)")
    }
}
