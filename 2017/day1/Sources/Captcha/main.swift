//
//  main.swift
//  CaptchaPackageDescription
//
//  Created by Jais Cheema on 1/1/18.
//

import Foundation

public final class Runner {
    let arguments: [String]

    enum Error: Swift.Error {
        case missingInput
    }

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }

    public func run() {
        guard arguments.count > 1 else {
            print("Usage: captcha argument")
            return
        }

        let input = arguments[1]
        print("---------------------------------")
        print("Captcha: \(captcha(for: input))")
    }
}

Runner().run()

