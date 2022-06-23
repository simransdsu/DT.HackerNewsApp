  //
  //  ContentView.swift
  //  HackerNewsApp
  //
  //  Created by Simran Preet Narang on 2022-06-23.
  //

import SwiftUI

struct ContentView: View {
  
  @StateObject var viewModel = ViewModel()
  
  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.posts, id: \.objectID) { post in
          NavigationLink {
            DetailView(url: post.url)
          } label: {
            Text(post.title)
              .font(.title3)
              .padding(.vertical, 4)
          }
        }
      }
      .navigationTitle("Top News")
    }
    .task {
      await viewModel.fetchPosts()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


class ViewModel: ObservableObject {
  @Published var posts = [Post]()
  @Published var appError: AppError?
  
  func fetchPosts() async {
    do {
      posts = try await HackerNewsAPIService.shared.getPosts()
    } catch {
      if let error = error as? AppError {
        appError = error
        return
      }
      appError = AppError(message: "Something went wrong, please try again", description: error.localizedDescription)
    }
  }
}
