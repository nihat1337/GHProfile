//
//  UserModel.swift
//  GHProfile
//
//  Created by Nihat Samadov on 04.06.26.
//

struct GithubUser: Decodable {
    let login: String
    let avatarUrl: String?
    let bio: String?
 
}
