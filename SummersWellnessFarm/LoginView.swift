//
//  LoginView.swift
//  SummersWellnessFarm
//
//  Created by Kapp, Tara  (Student) on 3/16/25.
//import SwiftUI

import SwiftUI
import SwiftData


struct LoginView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var email = ""
    @State private var password = ""
    @State private var loginError = ""
    @State private var loggedInUser: User?
    @State private var isShowingSignup = false
    @AppStorage("isAuthenticated") private var isAuthenticated = false
    @AppStorage("loggedInUserEmail") private var loggedInUserEmail = ""


    var body: some View {
        NavigationStack {
            VStack {
                if isAuthenticated, let user = loggedInUser {
                    Text("Welcome, \(user.name)!")
                        .font(.custom("AvenirNext-Regular", size: 28))
                        .padding()
                    
                    
                    Text("Select Your Dashboard:")
                        .font(.custom("AvenirNext-Regular", size: 17))
                        .padding(.top)
                    
                    // Select Dashboard Type
                    ForEach(DashboardType.allCases, id: \.self) { type in
                        NavigationLink(value: type) {
                            Text("\(type.rawValue) Dashboard")
                        }
                        .buttonStyle(.borderedProminent)
                        .padding()
                        .onTapGesture {
                            print("Dashboard type selected: \(type.rawValue)")
                        }}
                } else {
                    // Login Form
                    Text("Login to Your Account")
                        .font(.custom("AvenirNext-Regular", size: 15))
                        .padding()
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding()
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    // Login Button
                    Button("Login") {
                        print("Login button clicked")
                        login()
                        
                    }
                    .padding()
                    
                    Text(loginError)
                        .foregroundColor(.red)
                    
                    // Sign Up Button
                    Button("Don't have an account? Sign Up") {
                        isShowingSignup = true
                    }
                    .foregroundColor(.blue)
                    .padding()
                }
            }
            // ✅ Attach navigationDestination to NavigationStack directly!
            .navigationDestination(for: DashboardType.self) { type in
                if let user = loggedInUser {
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
            .navigationDestination(isPresented: $isShowingSignup) {
                SignupView()
            }
        }
    }

    func loadUser() {
        print("Attempting to load user from AppStorage")
        if !loggedInUserEmail.isEmpty {
            let descriptor = FetchDescriptor<User>(predicate: #Predicate { $0.email == loggedInUserEmail })
            if let user = try? modelContext.fetch(descriptor).first {
                loggedInUser = user
                print("User loaded: \(user.name)")
            } else {
                print("Error: User not found with email: \(loggedInUserEmail)")
            }
        } else {
            print("No email found in AppStorage")
        }
    }

    
    // Login Function
    func login() {
        do {
            let descriptor = FetchDescriptor<User>(predicate: #Predicate { $0.email == email && $0.password == password })
            if let user = try modelContext.fetch(descriptor).first {
                loggedInUser = user
                isAuthenticated = true
            } else {
                loginError = "Invalid email or password"
            }
        } catch {
            loginError = "Error fetching user: \(error.localizedDescription)"
        }
    }
}

