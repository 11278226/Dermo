//
//  DermoViewModelTests.swift
//  DermoTests
//
//  Created by Diarmuid O'Keeffe on 16/02/2022.
//

@testable import Dermo
import XCTest

@MainActor
class DermoViewModelTests: XCTestCase {
    
    var viewModel: DermoViewModel = DermoViewModel(webService: FakeSuccessWebservice())
    var errorViewModel: DermoViewModel = DermoViewModel(webService: FakeErrorWebservice())
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testSuccessFetchImages() async {
        await viewModel.fetchImages()
        
        XCTAssertEqual(viewModel.datasource.count, 1)
        XCTAssertFalse(errorViewModel.showError)
    }
    
    func testErrorFetchImages() async {
        await errorViewModel.fetchImages()
        
        XCTAssertEqual(errorViewModel.datasource.count, 0)
        XCTAssertTrue(errorViewModel.showError)
        
    }
    
    
}
