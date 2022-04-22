//
//  ComicsView.swift
//  Marvel Test
//
//  Created by Stuti Munshi on 2022-04-18.
//

import SwiftUI
import SDWebImageSwiftUI

struct ComicsView: View {
    @EnvironmentObject var homeScreen: HomeView
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false, content: {
                
                if homeScreen.fetchedComic.isEmpty{
                    ProgressView()
                        .padding(.top,20)
                }
                else {
                    
                    VStack(spacing: 15){
                        
                        ForEach(homeScreen.fetchedComic) {comic in
                            
                            ComicsHorizontallView(comic: comic)
                        }
                    }
                }
                
            })
        }
        .onAppear(perform: {
            if homeScreen.fetchedComic.isEmpty{
                homeScreen.searchForComic()
            }
        })

    }
}

struct ComicsView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsView()
    }
}

struct ComicsHorizontallView: View {

    var comic: Comics

    var body: some View {
//        VStack {
//            ScrollView(.horizontal) {
                HStack(spacing: 5) {
                    WebImage(url: retrieveImage(data: comic.thumbnail))
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .leading)
//                        .aspectRatio(contentMode: .fill)
                    //                        .frame(idealWidth: 150, idealHeight: 1)
                                            .cornerRadius(6)
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text(comic.title)
                            .font(.title3)
                            .fontWeight(.bold)
                            .lineLimit(4)
                        
                        if let description = comic.description {
                            
                            Text(description)
                                .font(.caption)
                                .foregroundColor(.blue)
                                .lineLimit(6)
                                .multilineTextAlignment(.leading)
                        }
                        
                        
                        HStack(spacing: 10){
                            ForEach(comic.urls,id: \.self) {data in
                                
                                NavigationLink(destination: WebView(url: retrieveURL(data: data))
                                    .navigationTitle(retrieveURLType(data: data)),
                                    label: {
                                        Text(retrieveURLType(data:data))
                                })
                            }
                        }
                    })
                    
//                    VStack {
//                        HStack(spacing: 10) {
//
//                            ForEach(character.urls,id: \.self) {data in
//
//                                NavigationLink(destination: WebView(url: retrieveURL(data: data))
//                                    .navigationTitle(retrieveURLType(data: data)),
//                                    label: {
//                                        Text(retrieveURLType(data:data))
//                                })
//                            }
//                        }
//
//                    }
//                }
//
//                HStack(spacing: 8) {
//                    Text(character.name)
//                        .font(.title3)
//                        .fontWeight(.bold)
//
//                    Text(character.description)
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                        .lineLimit(3)
//                        .multilineTextAlignment(.leading)
//                }
                Spacer(minLength: 0)
            }
                .padding(.horizontal)
//        }
    }

    func retrieveImage(data: [String: String]) -> URL {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""

        return URL(string: "\(path).\(ext)")!
    }
    
    func retrieveURL(data: [String: String]) -> URL {
        
        let url = data["url"] ?? ""
        
        return URL(string: url)!
    }
    
    func retrieveURLType(data: [String: String]) -> String {
        
        let type = data["type"] ?? ""
        
        return type.capitalized
        
    }
}


