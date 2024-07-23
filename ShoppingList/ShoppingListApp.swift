//
//  ShoppingListApp.swift
//  ShoppingList
//
//  Created by Sumukha Kashyap on 16.07.24.
//

import SwiftUI

@main
struct ShoppingListApp: App {
    
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
            }
        }
        .environmentObject(HomeViewModel())
    }
}
