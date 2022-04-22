//
//  HomeView.swift
//  Marvel Test
//
//  Created by Stuti Munshi on 2022-03-11.
//

import SwiftUI
import Combine
import CryptoKit

class HomeView: ObservableObject {
    
    @Published var searchQuery = ""
    
    var cancelSearch: AnyCancellable? = nil
    
    @Published var fetchedCharacter: [Characters]? = nil
    
    @Published var fetchedComic: [Comics] = []
    
    @Published var offset: Int = 0
    
    
    init() {
        cancelSearch = $searchQuery
            .removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: {word in
                if word == "" {
//                    reset Data
                    self.fetchedCharacter = nil
                }
                else {
//                    search Data
                    self.searchForCharacter()
                }
            })
    }
    
    func searchForCharacter() {
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD(data: "\(ts)\(privateKey)\(publicKey)")
        
        let originalQuery = searchQuery.replacingOccurrences(of: " ", with: "%20")
        
        let url = "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=\(originalQuery)&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        
        let sesh = URLSession(configuration: .default)
        
        sesh.dataTask(with:  URL(string: url)!) { (data, _, error) in
            
            if let errorOfUrl = error{
                print(errorOfUrl.localizedDescription)
                return
            }
            
            guard let dataAPI = data else {
                print("No data found!")
                return
            }
            
            do {
               
                let characters = try JSONDecoder().decode(resultOfAPI.self, from: dataAPI)
                
                DispatchQueue.main.async {
                    if self.fetchedCharacter == nil{
                        self.fetchedCharacter = characters.data.results
                    }
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    func searchForComic() {
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD(data: "\(ts)\(privateKey)\(publicKey)")
                
        let url = "https://gateway.marvel.com:443/v1/public/comics?limit=25&offset=\(offset)&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        
        let sesh = URLSession(configuration: .default)
        
        sesh.dataTask(with:  URL(string: url)!) { (data, _, error) in
            
            if let errorOfUrl = error{
                print(errorOfUrl.localizedDescription)
                return
            }
            
            guard let dataAPI = data else {
                print("No data found!")
                return
            }
            
            do {
               
                let characters = try JSONDecoder().decode(resultOfComicAPI.self, from: dataAPI)
                
                DispatchQueue.main.async {
                        self.fetchedComic = characters.data.results
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }

    
    func MD(data: String) -> String {
        
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        
        return hash.map{
            String(format: "%02hhx", $0)
        }
        .joined()
        
    }
}
