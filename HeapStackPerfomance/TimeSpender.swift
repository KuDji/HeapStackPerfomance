//
//  TimeSpender.swift
//  HeapStackPerfomance
//
//  Created by Анатолий on 17/09/2019.
//  Copyright © 2019 Anatoliy. All rights reserved.
//

import Foundation

class TimeSpender {

    private var strartTime: CFAbsoluteTime!

    func start() {
        strartTime = CFAbsoluteTimeGetCurrent()
    }

    func finish(_ log: String) {
        print("Time - \(CFAbsoluteTimeGetCurrent() - strartTime), \(log)")
    }
}
