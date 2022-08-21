//
//  AddTodoView.swift
//  TodoApp
//
//  Created by udesh sharma on 20/08/22.
//

import SwiftUI

struct AddTodoView: View {
    
//    @StateObject todo:ToDoListViewModel=ToDoListViewModel()
    @EnvironmentObject var viewModel: ToDoListViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State  var des: String = ""
    @State  var title: String = ""
    @State var isShowAler: Bool = false
        
        var body: some View {
            NavigationView {
                VStack(alignment: .center) {
                    TextField("Enter the Title", text: $title
                    
                    ).textFieldStyle(.roundedBorder)
                        
                        .foregroundColor(.blue)// <1>, <2>
                    
                    
                    TextField("Enter the Des", text: $des
                    
                    ).textFieldStyle(.roundedBorder)
                        
                        .foregroundColor(.blue)
                    
                    
                    Button(action:save, label: {
                        
                        Text("save").frame(width: 200, height: 40, alignment: .center).background(.red)
                            .foregroundColor(.white)
                            .cornerRadius(10).padding(.top,20)
                    })

                    
                }.padding()
                    .alert(isPresented: $isShowAler,content:{
                        Alert(title:Text( "Plaese Enter the long text"))
                    })
                
                
            }
        }
    
    
    func save(){
        
        if(title.count>3 && des.count>10){
            viewModel.addTodo(title: title, des: des)
            self.presentationMode.wrappedValue.dismiss()
            
        }else{
            
            isShowAler.toggle()
            
        }
        
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView().environmentObject(ToDoListViewModel())
    }
}
