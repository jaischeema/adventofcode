import SwiftCLI

let puzzles: [Int: Day.Type] = [
    1: Day1.self,
    2: Day2.self,
    3: Day3.self,
]

enum CliError: Error {
    case invalidDay
    case invalidPuzzle
}

class PuzzleRunnerCommand: Command {
    let name = "run"

    let day = Key<Int>("-d", "--day", description: "Day for the puzzle")
    let puzzle = Key<Int>("-p", "--puzzle", description: "Puzzle solution to run")

    func execute() throws {
        if let day = day.value {
            guard let puzzleClassType = puzzles[day] else { throw CliError.invalidDay }

            switch puzzle.value {
            case .some(1):
                run(puzzle: puzzleClassType, [1])
            case .some(2):
                run(puzzle: puzzleClassType, [2])
            case .none:
                run(puzzle: puzzleClassType, [1, 2])
            default:
                throw CliError.invalidPuzzle
            }
        } else {
            puzzles.forEach { run(puzzle: $0.1, [1, 2]) }
        }
    }

    func run(puzzle puzzleClassType: Day.Type, _ puzzles: [Int]) {
        let puzzleClass = puzzleClassType.init()

        stdout <<< "-------------------------------------------------------------------"
        stdout <<< "Day \(puzzleClass.day)"
        stdout <<< "-------------------------------------------------------------------"

        if puzzles.contains(1) {
            print("Puzzle 1: ", terminator: "")
            puzzleClass.puzzle1()
        }

        if puzzles.contains(2) {
            print("Puzzle 2: ", terminator: "")
            puzzleClass.puzzle2()
        }
    }
}

let runner = CLI(singleCommand: PuzzleRunnerCommand())
runner.goAndExit()
