
import Foundation

func spiral(upto: Int) -> [(Int, Int)] {
    var xAxisMaxValue = 0
    var yAxisMaxValue = 0
    var xAxisIncrement = 0
    var yAxisIncrement = 0

    var currentX = 0
    var currentY = 0

    var results = [(Int, Int)]()

    (1..<upto).forEach { _ in
        if currentX == xAxisMaxValue {
            if currentY == -yAxisMaxValue {
                xAxisMaxValue += 1
                yAxisMaxValue += 1
                xAxisIncrement = 1
                yAxisIncrement = 0
            } else if currentY == yAxisMaxValue {
                xAxisIncrement = -1
                yAxisIncrement = 0
            } else {
                xAxisIncrement = 0
                yAxisIncrement = 1
            }
        } else if currentX == -xAxisMaxValue {
            if currentY == -yAxisMaxValue {
                xAxisIncrement = 1
                yAxisIncrement = 0
            } else {
                xAxisIncrement = 0
                yAxisIncrement = -1
            }
        }

        currentX += xAxisIncrement
        currentY += yAxisIncrement

        results.append((currentX, currentY))
    }

    return results
}

func stepsToData(forValue value: Int) -> Int {
    guard let lastElement = spiral(upto: value).last else { return 0 }
    return abs(lastElement.0) + abs(lastElement.1)
}

assert(stepsToData(forValue: 1) == 0)
assert(stepsToData(forValue: 12) == 3)
assert(stepsToData(forValue: 23) == 2)
assert(stepsToData(forValue: 1024) == 31)


print(stepsToData(forValue: 277678))

