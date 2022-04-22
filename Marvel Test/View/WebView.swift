//
//  WebView.swift
//  Marvel Test
//
//  Created by Stuti Munshi on 2022-04-16.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
        
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView , context: Context) {
        
    }
}

