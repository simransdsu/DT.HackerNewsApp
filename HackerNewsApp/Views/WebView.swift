//
//  WebView.swift
//  HackerNewsApp
//
//  Created by Simran Preet Narang on 2022-06-23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  let urlString: String?
  
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    guard let urlString = urlString,
      let url = URL(string: urlString) else { return }
    
    let request = URLRequest(url: url)
    uiView.load(request)
  }
}
