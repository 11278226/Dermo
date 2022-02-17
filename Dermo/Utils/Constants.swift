//
//  Constants.swift
//  Dermo
//
//  Created by Diarmuid O'Keeffe on 16/02/2022.
//

import Foundation

struct Constants {
    
    struct Urls {
                
        static let flickr: URL? = URL(string: "https://www.flickr.com/services/rest/?api_key=5143d283f93133f32817d5824b28532f&safe_search=1&format=json&nojsoncallback=1&method=flickr.photos.getRecent&page=1&per_page=100")

    }
    
    struct Strings {
        static let flickrImageBaseURLString: String = "https://live.staticflickr.com/"
        static let successWebServiceID: String = "1"
        static let successWebServiceTitle: String = "Hello One"
        static let successWebServiceOwner: String = "Diarmuid"
        static let successWebServiceServer: String = "server"
        static let successWebServiceSecret: String = "secret"
    }
    
}
