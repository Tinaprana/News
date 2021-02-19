//
//  ContentView.swift
//  News
//
//  Created by Tina Pourramezan on 17/02/2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView{
            
            List(networkManager.posts){post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    
                    VStack(alignment:.leading){
                        
                        ImageView(withURL: post.urlToImage ?? "")
                        
                        Text(post.title)
                           .font(Font.custom("OpenSans-Bold", size: 18))
           
                        
                        Text(post.publishedAt!)
                            .font(Font.custom("OpenSans-Regular", size: 18))
                            .foregroundColor(.gray)
                        
                        
                    }
                    
                }
                
            }
            
            .navigationBarTitle("News")
            
        }
        .onAppear {
            self.networkManager.fetchData()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



