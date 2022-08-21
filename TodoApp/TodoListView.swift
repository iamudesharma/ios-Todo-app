//
//  TodoListView.swift
//  TodoApp
//
//  Created by udesh sharma on 21/08/22.
//

import SwiftUI

struct TodoListView: View {
    
   @EnvironmentObject var viewModel :ToDoListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.itemList){
                todo  in
                HStack {
                    VStack(alignment: .leading) {
                        Text(todo.title)
                        Text(todo.des).foregroundColor(.gray)
                            .font(.caption)}
                    
                    Spacer()
                    
                    if todo.isCompleted{
                        
                        Image(systemName: "checkmark.seal.fill").foregroundColor(.blue)
                    }else{
                        Image(systemName: "checkmark.seal").foregroundColor(.red)
                            .onTapGesture {
                                
                                
                                viewModel.update(todo: TodoModel(title: todo.title, des: todo.des, isCompleted: true), index: 0)
                            }
                    }
                }.padding()
    
                 
            }.onDelete{
                
                index in
                
                self.viewModel.itemList.remove(atOffsets: index)
            }
            .listStyle(.automatic)
            
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
