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
    @State var image:UIImage = UIImage()
    init(withURL urlToImage:String) {
        imageLoader = ImageLoader(urlToImage:urlToImage)
    }
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                //                .aspectRatio(contentMode: .fit)
                .frame(width:300, height:100)
            
        }.onReceive(imageLoader.dataPublisher) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
}
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "")
    }
} 
