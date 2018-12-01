import Foundation
import XCTest
@testable import Captcha

class MainTest: XCTestCase {
    func testCaptcha() {
        XCTAssertEqual(captcha(for: "1212"), 6)
        XCTAssertEqual(captcha(for: "1221"), 0)
        XCTAssertEqual(captcha(for: "123425"), 4)
        XCTAssertEqual(captcha(for: "123123"), 12)
        XCTAssertEqual(captcha(for: "12131415"), 4)
    }
}
