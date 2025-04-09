//
//  DashboardViewModel.swift
//  SummersWellnessFarm
//
//  Created by Kapp, Tara  (Student) on 3/16/25.
//


// Fetches data and handles logic

import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var user: User
    @Published var dashboardType: DashboardType

    init(user: User, dashboardType: DashboardType) {
        self.user = user
        self.dashboardType = dashboardType
    }
}

enum DashboardType: String, CaseIterable, Hashable {
    case personal = "Personal"
    case corporate = "Corporate"
    case wedding = "Wedding"
}

