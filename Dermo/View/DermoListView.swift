//
//  DermoListView.swift
//  Dermo
//
//  Created by Diarmuid O'Keeffe on 16/02/2022.
//

import SwiftUI

struct DermoListView: View {
    
    @StateObject var viewModel: DermoViewModel = DermoViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.datasource, id: \.id) { imageViewModel in
                NavigationLink(destination: DermoImageDetailView(viewModel: imageViewModel)) {
                    HStack(alignment: .top) {
                        AsyncImage(url: imageViewModel.imageURL) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 90, height: 90)
                        .background(Color.gray)
                        .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(imageViewModel.title)
                                .font(.headline)
                                .padding(.bottom, 4)
                            Text("by \(imageViewModel.owner)")
                                .font(.subheadline)
                        }
                        Spacer()
                    }
                }
            }
            .task({
                if viewModel.datasource.isEmpty {
                    await viewModel.fetchImages()
                }
            })
            .refreshable {
                await viewModel.fetchImages()
            }
        }.alert(isPresented: $viewModel.showError, content: {
            Alert(
              title: Text("Error"),
              message: Text(viewModel.errorMessage ?? "")
            )
          })
    }
}

struct DermoListView_Previews: PreviewProvider {
    static var previews: some View {
        DermoListView()
    }
}
