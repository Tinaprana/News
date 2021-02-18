//
//  NetworkManager.swift
//  News
//
//  Created by Tina Pourramezan on 17/02/2021.
//

import Foundation

class NetworkManager:ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=4a8cc4e7c7254903a42b8ea1b5a673ba"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.articles
                            }
                        }catch{
                            print(error)
                        }
                    }
                    
                }
            }
            task.resume()
        }
    }
}
//articles instead hits
