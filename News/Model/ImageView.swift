//
//  ImageView.swift
//  News
//
//  Created by Tina Pourramezan on 18/02/2021.
//


import Combine
import SwiftUI
struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlToImage:url)
    }
    
    var body: some View {
        
        
        Image(uiImage: imageLoader.image ?? UIImage())
            .resizable()
            .frame(width:300, height:100)
    }
}
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "")
    }
}
