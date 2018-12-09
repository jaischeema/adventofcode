import Foundation

class Selection {
    let identifier: String
    let offsetLeft: Int
    let offsetTop: Int
    let width: Int
    let height: Int
    
    init(identifier: String, offsetLeft: Int, offsetTop: Int, width: Int, height: Int) {
        self.identifier = identifier
        self.offsetTop = offsetTop
        self.offsetLeft = offsetLeft
        self.width = width
        self.height = height
    }
    
    lazy var squaresOccupied: [Pair] = {
        return (offsetLeft...(offsetLeft + width - 1)).flatMap { x in
            return (offsetTop...(offsetTop + height - 1)).map { Pair(x: x, y: $0) }
        }
    }()
}

struct Pair: Hashable, CustomStringConvertible {
    let x: Int
    let y: Int
    
    var description: String {
        return "\(x) x \(y)"
    }
}

enum Day3ParsingError: Error {
    case parseFailed
}

class Day3: Day {
    var day: Int { return 3 }
    required init() {}

    lazy var input: Input = { Input(day: 3) }()

    lazy var selections: [Selection] = {
        try! input.contents().map { try parse(input: $0) }
    }()
    
    lazy var squareCounts: [Pair: Int] = {
        return selections.reduce(into: [:]) { (result, item) in
            item.squaresOccupied.forEach { pair in
                result[pair, default: 0] += 1
            }
        }
    }()

    func puzzle1() {
        let duplicateCount = squareCounts.filter { $0.value > 1 }.count
        print(duplicateCount)
    }

    func puzzle2() {
        let match = selections.first { selection in
            return selection.squaresOccupied.allSatisfy { squareCounts[$0, default: 1] == 1 }
        }
        print(match?.identifier ?? "")
    }

    func parse(input: String) throws -> Selection {
        let range = NSRange(location: 0, length: input.utf16.count)
        let pattern = "#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)"
        let regularExpression = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        
        guard let match = regularExpression.firstMatch(in: input, options: [], range: range),
            let idRange = Range(match.range(at: 1), in: input),
            let xCordRange = Range(match.range(at: 2), in: input),
            let yCordRange = Range(match.range(at: 3), in: input),
            let widthRange = Range(match.range(at: 4), in: input),
            let heightRange = Range(match.range(at: 5), in: input),
            let xCord = Int(input[xCordRange]),
            let yCord = Int(input[yCordRange]),
            let height = Int(input[heightRange]),
            let width = Int(input[widthRange]) else {
                throw Day3ParsingError.parseFailed
            }

        return Selection(identifier: String(input[idRange]),
                         offsetLeft: xCord,
                         offsetTop: yCord,
                         width: width,
                         height: height)
    }
}
