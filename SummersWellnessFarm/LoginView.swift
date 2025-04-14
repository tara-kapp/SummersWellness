//
//  LoginView.swift
//  SummersWellnessFarm
//
//  Created by Kapp, Tara  (Student) on 3/16/25.
//import SwiftUI

import SwiftUI
import SwiftData

struct LoginView: View {
    @EnvironmentObject var userSession: UserSession
    @Environment(\.modelContext) var modelContext
    @State private var email = ""
    @State private var password = ""
    @State private var loginError = ""
    @State private var isShowingSignup = false

    // ✅ Move @Query to class-level
    @Query private var users: [User]

    var body: some View {
        NavigationStack {
            VStack {
                // LOGO + HEADER
                VStack(spacing: 8) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
                .padding(.top)
                
                if userSession.isAuthenticated, let user = userSession.loggedInUser {
                    Text("Welcome, \(user.name)!")
                        .font(.custom("AvenirNext-Regular", size: 34))
                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                        .padding()

                    Text("Select Your Dashboard")
                        .font(.custom("AvenirNext-Bold", size: 25))
                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                        .padding(.top)

                    ForEach(DashboardType.allCases, id: \.self) { type in
                        NavigationLink(value: type) {
                            Text("\(type.rawValue) Dashboard")
                        }
                        .modifier(CustomButtonStyle())
                        .padding()
                    }

                    Button("Logout") {
                        userSession.logout()
                    }
                    .foregroundColor(.red)
                    .padding()
                } else {
                    loginForm
                }
            }
            .navigationDestination(for: DashboardType.self) { type in
                if let user = userSession.loggedInUser {
                    switch type {
                    case .personal:
                        Dashboard(viewModel: DashboardViewModel(user: user, dashboardType: type))
                    case .corporate:
                        CorporateDashboard(viewModel: DashboardViewModel(user: user, dashboardType: type))
                    case .wedding:
                        WeddingDashboard(viewModel: DashboardViewModel(user: user, dashboardType: type))
                    }
                } else {
                    Text("Error: No user found")
                }
            }
            .onAppear {
                userSession.loadLoggedInUser()
                print("All users: \(users)")
            }
        }
    }

    var loginForm: some View {
        VStack {
            Text("Login to Your Account")
                .font(.custom("AvenirNext-Regular", size: 34))
                .padding()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .font(.custom("AvenirNext-Regular", size: 22))
                .background(Color(red: 129/255, green: 100/255, blue: 73/255).opacity(0.08))
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.custom("AvenirNext-Regular", size: 22))
                .background(Color(red: 129/255, green: 100/255, blue: 73/255).opacity(0.08))
                .padding()

            Button("Login") {
                login()
            }
            .font(.custom("AvenirNext-Regular", size: 22))
            .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
            .padding()
            
            Button("Create an Account") {
                isShowingSignup = true
            }
            .padding()

            // Show SignupView as a sheet
            .navigationDestination(isPresented: $isShowingSignup) {
                SignupView()
            }


            Text(loginError)
                .font(.custom("AvenirNext-Regular", size: 22))
                .foregroundColor(.red)
        }
    }

    func login() {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)

            if let user = users.first(where: {
                $0.email.lowercased() == trimmedEmail && $0.password == trimmedPassword
            }) {
                userSession.logIn(user: user)
            } else {
                print("❌ Invalid login attempt — Entered email: \(trimmedEmail), password: \(trimmedPassword)")
                print("Available users: \(users.map { "\($0.email) / \($0.password)" })")
                loginError = "Invalid email or password"
            }
        }
    }
