import Foundation

func parseData(fromFilePath filePath: String) throws -> [[Int]] {
    let stringInput = try String.init(contentsOfFile: filePath)

    return stringInput
        .split(separator: "\n")
        .filter { $0.count != 0 }
        .map { $0.split(separator: "\t").flatMap { Int(String($0)) } }
}

func run() {
    let arguments = CommandLine.arguments

    guard arguments.count > 1 else {
        print("Input file not provided")
        return
    }

    guard let input = try? parseData(fromFilePath: arguments[1]) else {
        print("Unable to read provided input file :(")
        return
    }

    let result = input.reduce(into: 0) { sum, row in
        if let max = row.max(), let min = row.min() {
            sum += max - min
        }
    }

    print(result)
}

run()
