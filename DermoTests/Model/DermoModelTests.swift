//
//  DermoModelTests.swift
//  DermoTests
//
//  Created by Diarmuid O'Keeffe on 17/02/2022.
//

@testable import Dermo
import XCTest

class DermoModelTests: XCTestCase {
    
    var item: DermoModel!

    override func setUpWithError() throws {
        item = DermoModel(id: Constants.Strings.successWebServiceID, owner: Constants.Strings.successWebServiceOwner, secret: Constants.Strings.successWebServiceSecret, server: Constants.Strings.successWebServiceServer, farm: 1, title: Constants.Strings.successWebServiceTitle, isPublic: 1, isFriend: 0, isFamily: 0)
    }

    override func tearDownWithError() throws {
        item = nil
    }

    func testItemStruct() throws {
        XCTAssertEqual(item.id, Constants.Strings.successWebServiceID)
        XCTAssertEqual(item.owner, Constants.Strings.successWebServiceOwner)
        XCTAssertEqual(item.secret, Constants.Strings.successWebServiceSecret)
        XCTAssertEqual(item.server, Constants.Strings.successWebServiceServer)
        XCTAssertEqual(item.farm, 1)
        XCTAssertEqual(item.title, Constants.Strings.successWebServiceTitle)
        XCTAssertEqual(item.isPublic, 1)
        XCTAssertEqual(item.isFriend, 0)
        XCTAssertEqual(item.isFamily, 0)
    }

}
