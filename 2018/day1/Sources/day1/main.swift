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

let inputFilePath = FileManager().currentDirectoryPath.appending("/input.txt")
let tokens = try! parse(filePath: inputFilePath)
let totalValue = tokens.reduce(0) { $0 + $1.value }
print(totalValue)
