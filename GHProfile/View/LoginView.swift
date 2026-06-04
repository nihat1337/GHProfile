//
//  LoginView.swift
//  GHProfile
//
//  Created by Nihat Samadov on 04.06.26.
//
import SwiftUI



struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @Binding var login: String
  
    @FocusState private var focus : Bool
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Welcome")
                .font(.largeTitle.bold())
                .foregroundStyle(.primary)
                .padding(.bottom, 8)
            Text("Sign in to continue")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.bottom, 24)
            
            TextField("Login", text: $login)
                .textFieldStyle(.plain)
                .textContentType(.username)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .focused($focus)
                .padding(.horizontal)
                .padding(.vertical, 12)
                .frame(maxWidth: 360)
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                .shadow(color: Color.purple.opacity(0.5), radius: 10, x: 0, y: 6)
            
            Text("Enter your username to see your profile")
                .bold()
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.top, 16)
            
            Button(action: {
                if !login.isEmpty {
                    withAnimation{
                        isLoggedIn = true
                    }
                    }
                focus = false
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .font(.headline)
            }
            .tint(.purple)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .frame(maxWidth: 360)
            .padding(.top, 12)
            
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color.purple.opacity(0.25), Color.indigo.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .ignoresSafeArea()
        
        
    }
}

