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
                            .fontWeight(.black)
                        
                        Text(post.publishedAt!)
                            .fontWeight(.medium)
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



