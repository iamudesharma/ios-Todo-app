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
                
                
                NavigationLink(destination: {
                    
                    AddTodoView()
                    
                }, label: {
                    HStack{
                        
                        Image(systemName: "plus")
                        Text("Add a Todo")
                    }.frame(width: 200, height: 40, alignment: .center)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(10)
                    
                }).padding(.top,20)
                
                
            
                
                List {
                    ForEach(viewModel.itemList){
                        todo  in
                        Text(todo.title)
            
                         
                    }.onDelete{
                        
                        index in
                        
                        self.viewModel.itemList.remove(atOffsets: index)
                    }
                    .listStyle(.automatic)
                    
                }
            
            }.navigationTitle("Todo App")
                .navigationBarTitleDisplayMode(.automatic)
                
            
            
        }
    
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ToDoListViewModel())
    }
}


struct TodoModel: Hashable, Codable, Identifiable {
    var id = UUID().uuidString
     var title: String
     var des:String
     var isCompleted:Bool
    
    
    
    
}


class ToDoListViewModel: ObservableObject {
    @Published var itemList: [TodoModel]=[
        ]

    
    init(){
        additem()
        
        
    }

 func   additem(){
     
     let item: [TodoModel]=[
        TodoModel(title: "Hello", des: "This a test", isCompleted: true),
        TodoModel(title: "Hello3", des: "This a test4", isCompleted: false),TodoModel(title: "Hello", des: "This a test", isCompleted: true),TodoModel(title: "Hello", des: "This a test5", isCompleted: true),
     ]
        
     itemList.append(contentsOf: item)
    }
    
    
  func  addTodo(title: String, des: String){
      
      let newItme :TodoModel = TodoModel(title: title, des: des, isCompleted: false)
        
        itemList.append(newItme)
    }
}

