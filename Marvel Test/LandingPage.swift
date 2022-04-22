//
//  LandingPage.swift
//  Marvel Test
//
//  Created by Stuti Munshi on 2022-03-14.
//

import SwiftUI

struct LandingPage: View {
    @State private var isShowingHomePage = false

    var body: some View {
       
        NavigationView {
            ZStack {

                Color.gray.ignoresSafeArea()

                VStack(spacing: 30) {
                    Text("Welcome to").font(.largeTitle).foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center).padding(.bottom, 640)
                    Text("Marvel's World!").font(.largeTitle).bold().foregroundColor(.white).offset(y: -640)
                }

                    ZStack {
                        Image("hulk punch").resizable().scaledToFit().padding(.top, 130)
                        Image("marvel").resizable().scaledToFit().offset(y: -140)

                    }

                Text("Explore what the Marvel world has to offer!").font(.subheadline).foregroundColor(.white).padding(.top, 470).animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))

//                Button(action:{
//                    isShowingHomePage = true
//                }) {
//                    HStack {
//                        Text("Continue")
//                        Image(systemName: "chevron.right")
//
//                    }
//                    .foregroundColor(.white)
//                    .padding(.horizontal)
//                    .padding()
//                    .background(Capsule())
//                    .offset(y:300)
//                    .animation(Animation.interpolatingSpring(stiffness: 50, damping: 10))
//                }
//                .accentColor(.purple)
                
                NavigationLink(
                    destination: Home(),
                    isActive: $isShowingHomePage,
                    label: {
                        Text("")
                    })
                
                Button("Continue") {
                    isShowingHomePage = true
                }
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding()
                .background(Capsule())
                .offset(y:300)
                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 7).delay(0.1))
            }
        }
    }
    
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
