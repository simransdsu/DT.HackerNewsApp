//
//  NetworkManager.swift
//  MVVM News App
//
//  Created by Simran Preet Narang on 2022-06-21.
//

import Foundation

class NetworkManager {
  
  public static let shared = NetworkManager()
  
  private init() { }
  
  func get<T : Codable>(url: URL) async throws -> T {
    let (data, _) = try await URLSession.shared.data(from: url)
    let result = try JSONDecoder().decode(T.self, from: data)
    return result
  }
}
