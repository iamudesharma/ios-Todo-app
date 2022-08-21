//
//  ContentView.swift
//  TodoApp
//
//  Created by udesh sharma on 18/08/22.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var viewModel :ToDoListViewModel
    var body: some View {
        
        NavigationView{
            VStack{
//               
                ZStack {
                    
                    if viewModel.itemList.isEmpty {
                        
                        VStack {
                            Text("No Items").animation(.easeOut)
                            
                            
                            HStack{
                                
                                Image(systemName: "plus")
                                Text("Add a Todo")
                            }.frame(width: 200, height: 40, alignment: .center)
                                .foregroundColor(.white)
                                .shadow(color: Color(UIColor.systemRed).opacity(0.7), radius: 10, x: 0.3, y: 0.4)
                                
                                .background(.red)
                                .cornerRadius(10)
                        }
                        
                        
                       

                    } else{
                        
                        TodoListView().transition(.offset())
                        
                    }
                    }.navigationTitle("Todo App")
                    .navigationViewStyle(.automatic)
                    .navigationBarItems(trailing: NavigationLink("Add", destination: AddTodoView()))
            }
        
        }
    
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ToDoListViewModel())
    }
}





