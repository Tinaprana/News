//
//  ImageLoader.swift
//  News
//
//  Created by Tina Pourramezan on 18/02/2021.
//


import Combine
import Foundation

class ImageLoader: ObservableObject {
    
    var dataPublisher = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            dataPublisher.send(data)
        }
    }
    
    init(urlToImage:String) {
        guard let url = URL(string: urlToImage) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

