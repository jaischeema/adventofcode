import Foundation

enum Token {
    case addition(Int)
    case substraction(Int)

    var value: Int {
        switch self {
        case .addition(let value):
            return value
        case .substraction(let value):
            return -value
        }
    }
}

enum ParsingError: Error {
    case missingSymbol
    case invalidValue
}

func parse(input: String) throws -> Token {
    switch(input.first, Int(input.dropFirst())) {
    case (.some("+"), .some(let intValue)):
        return .addition(intValue)
    case (.some("-"), .some(let intValue)):
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
    let inputFilePath = FileManager().currentDirectoryPath.appending("/input.txt")
    return try! parse(filePath: inputFilePath)
}

func puzzle1() {
    let frequencies = generateFrequencies(startingAt: 0, with: readAndParseFile())
    guard let lastFrequency = frequencies.last else {
        print("Empty input set")
        return
    }
    print("Puzzle 1: \(lastFrequency)")
}

func puzzle2() {
    let tokens = readAndParseFile()
    let initialFrequencies = generateFrequencies(startingAt: 0, with: tokens)
    guard let initialReducedFrequency = initialFrequencies.last else {
        print("Empty input set")
        return
    }
    
    var startingValue = initialReducedFrequency
    var matchingFrequency: Int? = nil
    
    while(matchingFrequency == nil) {
        matchingFrequency = generateFrequencies(startingAt: startingValue, with: tokens).first { frequency in
            startingValue = frequency
            return initialFrequencies.contains(frequency)
        }
    }
    
    print("Puzzle 2: \(matchingFrequency ?? 0)")
}

puzzle1()
puzzle2()
