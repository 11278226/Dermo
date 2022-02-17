//
//  FakeSuccessWebService.swift
//  DermoTests
//
//  Created by Diarmuid O'Keeffe on 16/02/2022.
//

@testable import Dermo
import Foundation

class FakeSuccessWebservice: WebService {
    
    func fetchImages(url: URL?) async throws -> [DermoModel] {
        [DermoModel(id: Constants.Strings.successWebServiceID, owner: Constants.Strings.successWebServiceOwner, secret: "", server: "", farm: 1, title: Constants.Strings.successWebServiceTitle, isPublic: 1, isFriend: 0, isFamily: 0)]
    }
}
