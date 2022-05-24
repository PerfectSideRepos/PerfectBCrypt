import XCTest
@testable import PerfectBCrypt

class PerfectBCryptTests: XCTestCase {
    func testExample() {
    do {
      var salt = try BCrypt.Salt()
      print("salt", salt)
      let password = "Kk4DQuMMfZL9o"
      salt = "$2b$04$cVWp4XaNU8a4v1uMRum2SO"
      let shadow = "$2b$04$cVWp4XaNU8a4v1uMRum2SO026BWLIoQMD/TXg5uZV.0P.uO8m3YEm"
      let hashed = try BCrypt.Hash(password, salt: salt)
      XCTAssertEqual(hashed, shadow)
        if #available(iOS 10.1, *) {
            XCTAssertTrue(BCrypt.Check(password, hashed: shadow))
        }
      #if os(Linux)
        XCTAssertTrue(BCrypt.Check(password, hashed: shadow))
      #endif
      let expected:[UInt8] = [
        0x5b, 0xbf, 0x0c, 0xc2, 0x93, 0x58, 0x7f, 0x1c,
        0x36, 0x35, 0x55, 0x5c, 0x27, 0x79, 0x65, 0x98,
        0xd4, 0x7e, 0x57, 0x90, 0x71, 0xbf, 0x42, 0x7e,
        0x9d, 0x8f, 0xbe, 0x84, 0x2a, 0xba, 0x34, 0xd9
      ]
      let derived = try BCrypt.KDF("password", salt: "salt", desiredKeyBytes: expected.count, rounds: 4, ignoreFewRounds: true)
      XCTAssertEqual(derived, expected)
    }catch {
      XCTFail(error.localizedDescription)
    }
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
