//
//  ContentView.swift
//  GHProfile
//
//  Created by Nihat Samadov on 04.06.26.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var login = ""
    
    
    var body: some View {
        if isLoggedIn {
            GithubUserView(isLoggedIn: $isLoggedIn, login:  login)
        } else {
            LoginView(isLoggedIn: $isLoggedIn, login: $login)
        }
    }
}


#Preview {
    ContentView()
}
