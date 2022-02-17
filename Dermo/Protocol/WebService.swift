//
//  WebService.swift
//  Dermo
//
//  Created by Diarmuid O'Keeffe on 16/02/2022.
//

import Foundation

protocol WebService {
    func fetchImages(url: URL?) async throws -> [DermoModel]
}
