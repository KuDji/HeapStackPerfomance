import Foundation

// Тестируем:
// - производительность вызова методов для классов хранящих несколько классов
// и структур хранящих классы

class DummyClass {
    var flag: Bool
    var count: Int
    init(flag: Bool, count: Int) {
        self.flag = flag
        self.count = count
    }
}

class ContainerClass {
    var dummy0: DummyClass
    var dummy1: DummyClass
    var dummy2: DummyClass
    var dummy3: DummyClass
    var dummy4: DummyClass
    var dummy5: DummyClass
    var dummy6: DummyClass
    var dummy7: DummyClass
    var dummy8: DummyClass
    var dummy9: DummyClass

    init(dummy0: DummyClass,
         dummy1: DummyClass,
         dummy2: DummyClass,
         dummy3: DummyClass,
         dummy4: DummyClass,
         dummy5: DummyClass,
         dummy6: DummyClass,
         dummy7: DummyClass,
         dummy8: DummyClass,
         dummy9: DummyClass) {

        self.dummy0 = dummy0
        self.dummy1 = dummy1
        self.dummy2 = dummy2
        self.dummy3 = dummy3
        self.dummy4 = dummy4
        self.dummy5 = dummy5
        self.dummy6 = dummy6
        self.dummy7 = dummy7
        self.dummy8 = dummy8
        self.dummy9 = dummy9
    }
}

struct ContainerStruct {
    var dummy0: DummyClass
    var dummy1: DummyClass
    var dummy2: DummyClass
    var dummy3: DummyClass
    var dummy4: DummyClass
    var dummy5: DummyClass
    var dummy6: DummyClass
    var dummy7: DummyClass
    var dummy8: DummyClass
    var dummy9: DummyClass
}

@inline(never)
func testClass(_ container: ContainerClass) -> Int {
    let value = simpleCalculationForClass(container)
    return value
}

@inline(never)
func testStruct(_ container: ContainerStruct) -> Int {
    let value =  simpleCalculationForStruct(container)
    return value
}

@inline(never)
func simpleCalculationForClass(_ testClass: ContainerClass) -> Int {
    return testClass.dummy3.count + testClass.dummy9.count - testClass.dummy2.count
}

@inline(never)
func simpleCalculationForStruct(_ testStruct: ContainerStruct) -> Int {
    return testStruct.dummy3.count + testStruct.dummy9.count - testStruct.dummy2.count
}

@inline(never)
func calculateClassPerformance(with dummies: ContiguousArray<DummyClass>, iterations: Int64)
{
    let container = ContainerClass(
        dummy0: dummies[0],
        dummy1: dummies[1],
        dummy2: dummies[2],
        dummy3: dummies[3],
        dummy4: dummies[4],
        dummy5: dummies[5],
        dummy6: dummies[6],
        dummy7: dummies[7],
        dummy8: dummies[8],
        dummy9: dummies[9]
    )

    var result: Int = 0

    for _ in 0..<iterations {
        result += testClass(container)
    }

    print("Result: \(result)")
}

@inline(never)
func calculateStructPerformance(with dummies: ContiguousArray<DummyClass>, iterations: Int64)
{
    let container = ContainerStruct(
        dummy0: dummies[0],
        dummy1: dummies[1],
        dummy2: dummies[2],
        dummy3: dummies[3],
        dummy4: dummies[4],
        dummy5: dummies[5],
        dummy6: dummies[6],
        dummy7: dummies[7],
        dummy8: dummies[8],
        dummy9: dummies[9]
    )

    var result: Int = 0

    for _ in 0..<iterations {
        result += testStruct(container)
    }

    print("Result: \(result)")
}

func testCallString() {

    /// Iteration count for execution
    let testIterationCount: Int64 = 100_000

    /// Create an array of dummy classes with different data
    var dummies = ContiguousArray<DummyClass>()
    for j in 0..<10
    {
        let dummy = DummyClass(flag: j % 2 == 0, count: j)
        dummies.append(dummy)
    }

    let ts = TimeSpender()
    ts.start()
    calculateClassPerformance(with: dummies, iterations: testIterationCount)
    ts.finish("Struct Shell Finish")

    ts.start()
    calculateStructPerformance(with: dummies, iterations: testIterationCount)
    ts.finish("Class Shell Finish")
}


