//
//  captcha.swift
//  CaptchaPackageDescription
//
//  Created by Jais Cheema on 1/1/18.
//

public func captcha(for input: String) -> Int {
    let digits = input.flatMap { Int(String($0)) }
    let totalDigits = digits.count
    let lookAhead = totalDigits / 2

    let sum = digits.enumerated().reduce(into: 0) { sum, elementArgs in
        let (index, element) = elementArgs
        let nextIndex = (index + lookAhead) % totalDigits
        let nextElement = digits[nextIndex]
        if nextElement == element {
            sum += element
        }
    }

    return sum
}
