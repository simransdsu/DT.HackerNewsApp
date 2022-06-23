//
//  HackerNewsAPIService.swift
//  HackerNewsApp
//
//  Created by Simran Preet Narang on 2022-06-23.
//

import Foundation

struct HackerNewsAPIService {
  
  public static let shared = HackerNewsAPIService()
  
  private init() { }
  
  public func getPosts(withTags tags: String = "front_page") async throws -> [Post] {
    let result: PostsAPIResult = try await NetworkManager.shared.get(url: API.FRONT_PAGE_URL(tags: tags))
    return result.hits
  }
}
