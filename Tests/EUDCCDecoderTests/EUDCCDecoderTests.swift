import EUDCCKitTests
@testable import EUDCCDecoder

final class EUDCCDecoderTests: EUDCCKitTests {
    
    func testDecode() throws {
        let decodingResult = EUDCCDecoder().decode(
            from: self.validEUDCCBase45Representation
        )
        try XCTAssertNoThrow(decodingResult.get())
    }
    
    func testEncode() throws {
        let decodingResult = EUDCCDecoder().decode(
            from: self.validEUDCCBase45Representation
        )
        guard case .success(let eudcc) = decodingResult else {
            return XCTFail("\(decodingResult)")
        }
        let data = try JSONEncoder().encode(eudcc)
        let decodedEUDCC = try JSONDecoder().decode(EUDCC.self, from: data)
        XCTAssert(decodedEUDCC == eudcc)
    }
    
}
