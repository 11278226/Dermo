//
//  DermoImageDetail.swift
//  Dermo
//
//  Created by Diarmuid O'Keeffe on 16/02/2022.
//

import Kingfisher
import SwiftUI

struct DermoImageDetailView: View {
    
    let viewModel: DermoImageViewModel
    
    var body: some View {
        KFImage(viewModel.imageURL)
            .navigationTitle(viewModel.title)
    }
    
}
