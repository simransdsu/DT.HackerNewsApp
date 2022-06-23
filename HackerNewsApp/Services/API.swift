//
//  API.swift
//  MVVM News App
//
//  Created by Simran Preet Narang on 2022-06-21.
//

import Foundation

struct API {
  
  static let BASE_URL = "https://hn.algolia.com/api/v1"
  static let SEARCH_ENDPOINT = "\(BASE_URL)/search"
  
  static func FRONT_PAGE_URL(tags: String) throws -> URL {
    let urlstring = "\(SEARCH_ENDPOINT)?tags=\(tags)"
    guard let url = URL(string: urlstring) else {
      throw AppError(message: "Invalid request. Please try again",
                     description: "Invalid URL: \(urlstring), please make sure your url is correct.")
    }
    return url
  }
}
