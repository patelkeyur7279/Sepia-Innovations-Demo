//
//  PetDetailsWebView.swift
//  Sepia Innovations Demo
//
//  Created by Keyur Patel on 13/12/22.
//

import WebKit
import SwiftUI

struct PetDetailsWebView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    
    private var webView: WKWebView
    
    init(url: String) {
        webView = WKWebView(frame: .zero)
        webView.load(URLRequest(url: URL(string: url)!))
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
}
