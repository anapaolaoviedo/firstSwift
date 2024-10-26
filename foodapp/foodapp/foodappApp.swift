//
//  foodappApp.swift
//  foodapp
//
//  Created by Ana Paola Oviedo on 2024-10-24.
//

import SwiftUI

@main
struct foodapp: App {
    var body: some Scene {
        WindowGroup {
            BusinessListView(businesses: sampleBusinesses)  // Use your main view here
        }
    }
}
