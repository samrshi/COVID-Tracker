//
//  URLImage.swift
//  Playground
//
//  Created by hawkeyeshi on 8/11/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    @ObservedObject private var imageLoader = ImageLoader()
    
    var placeholder: Image
        
    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self.placeholder = placeholder
        imageLoader.fetchImage(url: url)
    }

    var body: some View {
        
        if let image = self.imageLoader.image {
            return AnyView(
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipped()
            )
        }
        
        return AnyView(placeholder.foregroundColor(.white))
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    func fetchImage(url: String) {
        if url == "unknown" {
            return
        }
        
        guard let imageURL = URL(string: url) else {
            fatalError("invalid url string")
        }
                
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                fatalError("error reading the image")
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

//struct URLImage_Previews: PreviewProvider {
//    static var previews: some View {
//        URLImage()
//    }
//}
