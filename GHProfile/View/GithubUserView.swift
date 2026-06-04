//
//  GithubUserView.swift
//  GHProfile
//
//  Created by Nihat Samadov on 04.06.26.
//


import SwiftUI

struct GithubUserView: View {
    @Binding var isLoggedIn: Bool
    let login: String
    
    @State private var user: GithubUser?
    var body: some View {
        NavigationStack{
            VStack(spacing:20) {
                Spacer()
                VStack(spacing: 12) {
                    AsyncImage(url: URL(string: user?.avatarUrl ?? "")){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    }placeholder: {
                        Circle()
                            .foregroundStyle(.secondary)
                    }
                    .frame(width: 140, height: 140)
                    .overlay(
                        Circle().stroke(Color.purple.opacity(0.3), lineWidth: 3)
                    )
                    
                    Text(user?.login ?? "Login Placeholder")
                        .font(.title.bold())
                        .foregroundStyle(.primary)
                    
                    Text(user?.bio ?? "Bio Placeholder")
                        .bold()
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    
                    
                }
                
                .padding(20)
                .frame(maxWidth: 420)
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.purple.opacity(0.15), radius: 20, x: 0, y: 10)
                Spacer()
            }
            .padding()
            .task {
                do{
                    user = try await getUser(login: login)
                }catch GHError.invalidURL{
                    print("invalid url")
                }catch GHError.invalidResponse{
                    print("invalid response")
                }catch GHError.invalidData{
                    print("invalid data")
                }catch{
                    print("unexpected error")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(colors: [Color.purple.opacity(0.25), Color.indigo.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            isLoggedIn = false
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
    }
    
}
