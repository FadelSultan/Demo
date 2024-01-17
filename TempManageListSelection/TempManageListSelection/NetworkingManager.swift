//
//  NetworkingManager.swift
//  TempManageListSelection
//
//  Created by Fadel Sultan on 09/01/2024.
//

import Foundation


class NetworkingManager {
    static func fetch<T>(_ type: T.Type, urlString url: String) async throws -> T where T : Decodable {
        print("[🔐] url: \(url)")
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }
      
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("aW9zTWFpbkFwcDppb3NBcHA0SGFzYQ==", forHTTPHeaderField: "authKey")
            let (data,_) = try await URLSession.shared.data(for: request)
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        }catch {
            throw error
        }
    }
}
