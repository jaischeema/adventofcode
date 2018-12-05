//
//  Day2.swift
//  2018
//
//  Created by Jais Cheema on 3/12/18.
//

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

class Day2 {
    func parse(filePath: String) throws -> [String] {
        let fileContents = try String(contentsOfFile: filePath)
        return fileContents
            .components(separatedBy: "\n")
            .filter { $0.count > 0 }
    }

    func readAndParseFile() -> [String] {
        let inputFilePath = FileManager().currentDirectoryPath.appending("/inputs/day2/input.txt")
        return try! parse(filePath: inputFilePath)
    }

    func puzzle1() {
        let words = readAndParseFile().map { Word($0) }

        let twos = words.filter { $0.hasDoubleDigits }
        let threes = words.filter { $0.hasTripleDigits }
        print("Checksum is \(twos.count * threes.count)")
    }

    func puzzle2() {
        let words = readAndParseFile().map { Word($0) }

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

        print("Matching words are: \(originalWord) & \(matchingWord)")
        print("Common letters: \(originalWord.remove(indices: indices))")
    }
}
