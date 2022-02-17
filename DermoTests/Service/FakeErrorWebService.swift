//
//  FakeErrorWebService.swift
//  DermoTests
//
//  Created by Diarmuid O'Keeffe on 16/02/2022.
//

@testable import Dermo
import Foundation

class FakeErrorWebservice: WebService {
    
    func fetchImages(url: URL?) async throws -> [DermoModel] {
        throw NetworkError.invalidData
    }
}
