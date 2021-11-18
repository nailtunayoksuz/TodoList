//
//  AddView.swift
//  TodoList
//
//  Created by Nail Tunay ÖKSÜZ on 18.11.2021.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldtext: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...", text: $textFieldtext)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                    .cornerRadius(10)
                
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }.padding(14)
        }
        .navigationTitle("Add An Item 🖋")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed(){
        if ttextIsAppropriate(){
            listViewModel.addItem(title: textFieldtext)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func ttextIsAppropriate() -> Bool{
        if textFieldtext.count < 3 {
            alertTitle = "Your new todo item must be at least three chareacters long!!! 😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        Alert(title: Text(alertTitle), message: Text(""), dismissButton: nil)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        
    }
}
