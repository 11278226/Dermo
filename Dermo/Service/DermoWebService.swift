//
//  DermoWebService.swift
//  Dermo
//
//  Created by Diarmuid O'Keeffe on 16/02/2022.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidData
    case decodingError
}

class DermoWebservice: WebService {
    
    func fetchImages(url: URL?) async throws -> [DermoModel] {
        
        guard let url = url else {
            return []
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let imagesResponse = try? JSONDecoder().decode(FlickrResult.self, from: data)
        
        return imagesResponse?.photos.photos ?? []
        
    }
}

