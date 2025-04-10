//
//  UserSession.swift
//  SummersWellnessFarm
//
//  Created by Kapp, Tara  (Student) on 3/30/25.
//
import SwiftUI
import SwiftData

class UserSession: ObservableObject {
    @Published var loggedInUser: User?
    @Published var isAuthenticated = false
    @AppStorage("loggedInUserEmail") var loggedInUserEmail = ""

    func logIn(user: User) {
        self.loggedInUser = user
        self.isAuthenticated = true
        self.loggedInUserEmail = user.email
    }

    func logout() {
        self.loggedInUser = nil
        self.isAuthenticated = false
        self.loggedInUserEmail = ""
    }

    func loadLoggedInUser() {
            // ✅ Fix: No need for optional binding, just check if it's empty
            if !loggedInUserEmail.isEmpty {
                // Fetch user from database (implement this properly)
                // Example: self.loggedInUser = fetchUserByEmail(loggedInUserEmail)
                self.isAuthenticated = true
        }
    }
}
