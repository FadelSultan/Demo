//
//  ContentView.swift
//  PhotosContainer
//
//  Created by Fadel Sultan on 10/12/2023.
//

import SwiftUI
import PhotosUI

final class ContentViewModel: ObservableObject {
    
    @Published  var photosData:[PhotosPickerItem] = []
    @Published  var photos:[UIImage] = []
    
    
    func setImages(from selections:[PhotosPickerItem])  {
        Task {
            
            var images: [UIImage] = []
            
            for selection in selections {
                if let data  = try? await selection.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        images.append(image)
                    }
                }
            }
            
            photos = images
        }
    }
    
}

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.photos, id: \.self) { photo in
                        Image(uiImage: photo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100 , height: 100)
                    }
                }
            }
            
            PhotosPicker(selection: $viewModel.photosData, maxSelectionCount: 5) {
                Text("Open PHotos library")
            }.onChange(of: viewModel.photosData) { oldValue, newValue in
                viewModel.setImages(from: viewModel.photosData)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
