//
//  CharactersView.swift
//  Marvel Test
//
//  Created by Stuti Munshi on 2022-03-11.
//

import SwiftUI
import SDWebImageSwiftUI


struct CharactersView: View {
    @EnvironmentObject var homeScreen: HomeView
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true, content: {
                VStack(spacing: 40) {
                    
                    HStack(spacing: 10) {
                        
                        Image(systemName: "magnifyingglass").foregroundColor(.black)
                        
                        TextField("Search For Character", text: $homeScreen.searchQuery).autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                }
                .padding(.top, -30)
                
                if let char = homeScreen.fetchedCharacter{
                   
                    if char.isEmpty {
                        Text("No Results").padding(.top, 20)
                    }
                    
                    else{
                        ForEach(char){data in
                            CharacterHorizontallView(character: data)
//                            Text(data.name)
                        }
                    }
                }
                
//                else{
//                    if homeScreen.searchQuery != ""{
//                        ProgressView().padding()
//                    }
//
//                }
            })
        }
        .navigationTitle("Marvel Characters")
//        .onAppear(perform: {
//            if homeScreen.fetchedCharacter?.isEmpty {
//                homeScreen.fetchedCharacter()
//            }
//        })
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CharacterHorizontallView: View {

    var character: Characters

    var body: some View {
//        VStack {
//            ScrollView(.horizontal) {
                HStack(spacing: 5) {
                    WebImage(url: retrieveImage(data: character.thumbnail))
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .leading)
//                        .aspectRatio(contentMode: .fill)
//                        .frame(idealWidth: 150, idealHeight: 1)
                        .cornerRadius(6)
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text(character.name)
                            .font(.title3)
                            .fontWeight(.bold)

                        Text(character.description)
                            .font(.caption)
                            .foregroundColor(.blue)
                            .lineLimit(6)
                            .multilineTextAlignment(.leading)
                        
                        HStack(spacing: 10){
                            ForEach(character.urls,id: \.self) {data in
                                
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

