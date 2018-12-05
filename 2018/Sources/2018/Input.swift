import Foundation

class Input {
    let filePath: String

    init(day: Int) {
        filePath = FileManager().currentDirectoryPath.appending("/inputs/day\(day)/input.txt")
    }

    func contents() throws -> LazyCollection<[String]> {
        let fileContents = try String(contentsOfFile: filePath)
        return fileContents
            .components(separatedBy: "\n")
            .lazy
            .filter { $0.count > 0 }
            .lazy
    }
}
