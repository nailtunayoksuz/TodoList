//
//  TodoListApp.swift
//  TodoList
//
//  Created by Nail Tunay ÖKSÜZ on 18.11.2021.
//

import SwiftUI

/*
 MVVM Architecture
 ------------------------------------
 
 Model - data point
 View - UI
 ViewModel - manages models for view
 
 
*/

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
        }
    }
}
