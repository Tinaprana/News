//
//  PostData.swift
//  News
//
//  Created by Tina Pourramezan on 17/02/2021.
//

import Foundation
struct Results:Decodable{
    let articles:[Post]
}
struct Post:Decodable,Identifiable {
    let id = UUID()
    let title:String
    let url:String?
    let publishedAt:String?
    let urlToImage:String?
    let source:Source
}

struct Source:Decodable{
    let name:String
}




