//
//  TodoListApp.swift
//  TodoList
//
//  Created by Eunji Hwang on 24/11/2023.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel = manage Models for View
 */

@main
struct TodoListApp: App {
    // 모든 곳에서 뷰가 사라지든 없어지든 유지되어야 하기 때문에
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
