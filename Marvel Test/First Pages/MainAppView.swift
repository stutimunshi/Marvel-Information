//
//  MainAppView.swift
//  Marvel Test
//
//  Created by Stuti Munshi on 2022-03-16.
//

import SwiftUI

struct MainAppView: View {
    @AppStorage("openPage") var openPage = true
    
    var body: some View {
        if openPage {
            LandingPage()
        } else {
            Home()
                .animation(.default)
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
