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

class Day1 {
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

    func parse(filePath: String) throws -> [Token] {
        let fileContents = try String(contentsOfFile: filePath)
        return try fileContents
            .components(separatedBy: "\n")
            .filter { $0.count > 0 }
            .map { try parse(input: $0) }
    }

    func generateFrequencies(startingAt: Int, with tokens: [Token]) -> LazyCollection<[Int]> {
        return tokens
            .lazy
            .reduce([]) { $0 + [($0.last ?? startingAt) + $1.value] }
            .lazy
    }

    func readAndParseFile() -> [Token] {
        let inputFilePath = FileManager().currentDirectoryPath.appending("/inputs/day1/input.txt")
        return try! parse(filePath: inputFilePath)
    }

    func puzzle1() {
        let frequencies = generateFrequencies(startingAt: 0, with: readAndParseFile())
        guard let lastFrequency = frequencies.last else {
            print("Empty input set")
            return
        }
        print("\(lastFrequency)")
    }

    func puzzle2() {
        let tokens = readAndParseFile()
        let initialFrequencies = generateFrequencies(startingAt: 0, with: tokens)
        guard let initialReducedFrequency = initialFrequencies.last else {
            print("Empty input set")
            return
        }

        var startingValue = initialReducedFrequency
        var matchingFrequency: Int?

        while matchingFrequency == nil {
            matchingFrequency = generateFrequencies(startingAt: startingValue, with: tokens).first { frequency in
                startingValue = frequency
                return initialFrequencies.contains(frequency)
            }
        }

        print("\(matchingFrequency ?? 0)")
    }
}
