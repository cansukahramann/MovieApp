//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 30.09.2022.
//

import SwiftUI

@main
struct MovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeScreen()
            } 
            .navigationViewStyle(.stack)
        }
    }
}
