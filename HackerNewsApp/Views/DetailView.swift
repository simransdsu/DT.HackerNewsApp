  //
  //  DetailView.swift
  //  HackerNewsApp
  //
  //  Created by Simran Preet Narang on 2022-06-23.
  //

import SwiftUI

struct DetailView: View {
  let url: String?
  
  var body: some View {
    WebView(urlString: url)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(url: nil)
  }
}
