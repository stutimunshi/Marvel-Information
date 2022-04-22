//
//  Home.swift
//  Marvel Test
//
//  Created by Stuti Munshi on 2022-03-11.
//

import SwiftUI

struct Home: View {
    @StateObject var homeScreen = HomeView()

    var body: some View {
        TabView {
            CharactersView()
            .tabItem {
                Image(systemName: "person.3.fill")
                Text("Characters")
            }
                .environmentObject(homeScreen)
            
            ComicsView()
            .tabItem {
                Image(systemName: "book.fill")
                Text("Comics")
            }
                .environmentObject(homeScreen)
//            Text("Comics").tabItem {
//                Image(systemName: "book.fill")
//                Text("Comics")
//            }
        }
//        
//        HStack {
//            Button("Go to landing page") {
//                openPage.toggle()
//    
//            }
//        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
