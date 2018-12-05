import Foundation

class Word {
    let stringValue: String

    lazy var characterCounts: [Character: Int] = {
        stringValue
            .lowercased()
            .reduce(into: [:]) { counts, letter in
                counts[letter, default: 0] += 1
            }
    }()

    init(_ value: String) {
        stringValue = value
    }

    var indices: DefaultIndices<String> { return stringValue.indices }
    var count: Int { return stringValue.count }

    subscript(index: String.Index) -> Character { return stringValue[index] }

    func differingIndices(word: Word) -> [String.Index]? {
        guard word.count == count else { return nil }

        return word.indices.filter { index in
            word[index] != self[index] ? true : false
        }
    }

    func remove(indices: [String.Index]) -> Word {
        var stringValueMutable = stringValue
        indices.forEach { stringValueMutable.remove(at: $0) }
        return Word(stringValueMutable)
    }

    var hasDoubleDigits: Bool { return characterCounts.values.contains(2) }
    var hasTripleDigits: Bool { return characterCounts.values.contains(3) }
}

extension Word: CustomStringConvertible {
    var description: String { return stringValue }
}

class Day2: Day {
    var day: Int { return 2 }

    lazy var input: Input = { Input(day: 2) }()

    lazy var words: [Word] = {
        try! input.contents().map { Word($0) }
    }()

    required init() {}

    func puzzle1() {
        let twos = words.filter { $0.hasDoubleDigits }
        let threes = words.filter { $0.hasTripleDigits }
        print("\(twos.count * threes.count)")
    }

    func puzzle2() {
        let similarWords: [(Word, Word)] = words.enumerated().compactMap { element in
            let (index, word1) = element

            let matchingFunc = { word2 in
                (word1.differingIndices(word: word2)?.count ?? 0) == 1
            }

            guard let matchingWord = words[index...].first(where: matchingFunc) else { return nil }
            return (word1, matchingWord)
        }

        guard let (originalWord, matchingWord) = similarWords.first,
            let indices = originalWord.differingIndices(word: matchingWord) else { return }

        print("\(originalWord.remove(indices: indices))")
    }
}
