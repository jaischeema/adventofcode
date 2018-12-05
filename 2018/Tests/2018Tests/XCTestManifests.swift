import XCTest

#if !os(macOS)
    public func allTests() -> [XCTestCaseEntry] {
        return [
            testCase(AOC2018Tests.allTests),
        ]
    }
#endif
