//
//  FakeServiceTests.swift
//  DermoTests
//
//  Created by Diarmuid O'Keeffe on 16/02/2022.
//

@testable import Dermo
import XCTest

class FakeServiceTests: XCTestCase {
    
    var errorServiceClient: WebService!
    var successServiceClient: WebService!
    
    override func setUpWithError() throws {
        errorServiceClient = FakeErrorWebservice()
        successServiceClient = FakeSuccessWebservice()
    }

    override func tearDownWithError() throws {
        errorServiceClient = nil
        successServiceClient = nil
    }
    
    func testSuccessLoadData() async {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let response = try? await successServiceClient.fetchImages(url: Constants.Urls.flickr)
        
        guard let response = response else {
            return
        }
        XCTAssertTrue(!response.isEmpty)
        XCTAssertEqual(response.count, 1)
    }
    
    func testFailureLoadData() async {
        // This is an example of a functional test case.
        var reachedError = false
        do {
            let _ = try await errorServiceClient.fetchImages(url: Constants.Urls.flickr)
        } catch {
            XCTAssertNotNil(error)
            reachedError = true
        }
        XCTAssertTrue(reachedError)
    }
}
