//
//  UserViewModel.swift
//  GHProfile
//
//  Created by Nihat Samadov on 04.06.26.
//

import Foundation

func getUser(login: String) async throws -> GithubUser {
    
    let endpoint = "https://api.github.com/users/\(login)"
    guard let url = URL(string: endpoint) else {
        throw GHError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw GHError.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(GithubUser.self, from: data)
    } catch {
        throw GHError.invalidData
    }
    
}
