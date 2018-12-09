protocol Day {
    init()

    func puzzle1()
    func puzzle2()

    var day: Int { get }
}

// Example solution
//
// class DayN: Day {
//     var day: Int { return N }
//     required init() {}
//
//     func puzzle1() {}
//     func puzzle2() {}
// }
