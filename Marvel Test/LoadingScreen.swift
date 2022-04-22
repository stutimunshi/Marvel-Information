//
//  LoadingScreen.swift
//  Marvel Test
//
//  Created by Stuti Munshi on 2022-03-14.
//

import SwiftUI

struct LoadingScreen: View {
    @State private var isShowingHomePage = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: Home(),
                    isActive: $isShowingHomePage,
                    label: {
                        Text("")
                    })
                
                Button("Tap to learn more about Marvel") {
                    isShowingHomePage = true
                }
            }
            .navigationTitle("Main Page").border(Color.black)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
    

}
