//
//  ItemListViewModel.swift
//  Dermo
//
//  Created by Diarmuid O'Keeffe on 16/02/2022.
//

import Combine
import Foundation

@MainActor
class DermoViewModel: ObservableObject {
    @Published private(set) var datasource: [DermoImageViewModel] = []
    @Published var showError = false
    var errorMessage: String?
    var webService: WebService
    
    init(webService: WebService = DermoWebservice()) {
        self.webService = webService
    }
    
    func fetchImages() async {
        do {
            let images = try await webService.fetchImages(url: Constants.Urls.flickr)
            handleSuccess(images: images.map(DermoImageViewModel.init))
        } catch {
            handleFailure(error: error)
        }
    }
}

private extension DermoViewModel {
    func handleSuccess(images: [DermoImageViewModel]) {
        datasource = images
    }

    func handleFailure(error: Error) {
        errorMessage = "\(error)"
        showError = true
    }
}

struct DermoImageViewModel {
    
    fileprivate var image: DermoModel
    
    var id: String {
        image.id
    }
    
    var title: String {
        image.title
    }
    
    var owner: String {
        image.owner
    }
    
    var imageURL: URL? {
        URL(string: Constants.Strings.flickrImageBaseURLString + image.server + "/" + image.id + "_" + image.secret + "_w.png")
    }
    
    static var `default`: DermoImageViewModel {
        let image = DermoModel(id: "1", owner: "", secret: "", server: "", farm: 1, title: "Hello One", isPublic: 1, isFriend: 0, isFamily: 0)
        return DermoImageViewModel(image: image)
    }
}
