//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by udesh sharma on 18/08/22.
//

import SwiftUI

@main
struct TodoAppApp: App {
    
    @StateObject var viewModel : ToDoListViewModel = ToDoListViewModel()
    
//    @EnvironmentObject var todoModel : ToDoListViewModel= ToDoListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
