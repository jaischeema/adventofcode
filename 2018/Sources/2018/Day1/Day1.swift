import Foundation

enum Token {
    case addition(Int)
    case substraction(Int)

    var value: Int {
        switch self {
        case let .addition(value):
            return value
        case let .substraction(value):
            return -value
        }
    }
}

enum ParsingError: Error {
    case missingSymbol
    case invalidValue
}

class Day1: Day {
    lazy var input: Input = { Input(day: 1) }()

    lazy var tokens: [Token] = {
        try! input.contents().map { try parse(input: $0) }
    }()

    var day: Int { return 1 }

    required init() {}

    func parse(input: String) throws -> Token {
        switch (input.first, Int(input.dropFirst())) {
        case let (.some("+"), .some(intValue)):
            return .addition(intValue)
        case let (.some("-"), .some(intValue)):
            return .substraction(intValue)
        case (.none, _):
            throw ParsingError.missingSymbol
        default:
            throw ParsingError.invalidValue
        }
    }

    func generateFrequencies(startingAt: Int) -> LazyCollection<[Int]> {
        return tokens
            .lazy
            .reduce([]) { $0 + [($0.last ?? startingAt) + $1.value] }
            .lazy
    }

    func puzzle1() {
        let frequencies = generateFrequencies(startingAt: 0)
        guard let lastFrequency = frequencies.last else {
            print("Empty input set")
            return
        }
        print("\(lastFrequency)")
    }

    func puzzle2() {
        let initialFrequencies = generateFrequencies(startingAt: 0)
        guard let initialReducedFrequency = initialFrequencies.last else {
            print("Empty input set")
            return
        }

        var startingValue = initialReducedFrequency
        var matchingFrequency: Int?

        while matchingFrequency == nil {
            matchingFrequency = generateFrequencies(startingAt: startingValue).first { frequency in
                startingValue = frequency
                return initialFrequencies.contains(frequency)
            }
        }

        print("\(matchingFrequency ?? 0)")
    }
}
