//
//  Post.swift
//  HackerNewsApp
//
//  Created by Simran Preet Narang on 2022-06-23.
//

import Foundation

struct Post: Codable {
  let title: String
  let url: String
  let objectID: String
}

struct PostsAPIResult: Codable {
  let hits: [Post]
}
