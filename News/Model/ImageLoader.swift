//
//  ImageLoader.swift
//  News
//
//  Created by Tina Pourramezan on 18/02/2021.
//


import Combine
import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    var urlToImage: String?
    var imageCache = ImageCache.getImageCache()
    
    init(urlToImage: String?) {
        self.urlToImage = urlToImage
        loadImage()
    }
    
    func loadImage() {
        if loadImageFromCache() {
            print("Cache hit")
            return
        }
        
        print("Cache miss, loading from url")
        loadImageFromUrl()
    }
    
    func loadImageFromCache() -> Bool {
        guard let urlToImage = urlToImage else {
            return false
        }
        
        guard let cacheImage = imageCache.get(forKey: urlToImage) else {
            return false
        }
        
        image = cacheImage
        return true
    }
    
    func loadImageFromUrl() {
        guard let urlToImage = urlToImage else {
            return
        }
        guard let url = URL(string: urlToImage) else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }
    
    
    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        guard let data = data else {
            print("No data found")
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            
            self.imageCache.set(forKey: self.urlToImage!, image: loadedImage)
            self.image = loadedImage
        }
    }
}

