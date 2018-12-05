let puzzles = [
    ("Day 2, Puzzle 1", Day2().puzzle1),
    ("Day 2, Puzzle 2", Day2().puzzle2),
]

puzzles.forEach { puzzle in
    let (description, puzzleFunc) = puzzle
    print("== \(description) =======================================")
    puzzleFunc()
}
