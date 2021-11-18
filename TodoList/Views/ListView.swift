//
//  ListView.swift
//  TodoList
//
//  Created by Nail Tunay ÖKSÜZ on 18.11.2021.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first title!", isCompleted: false),
        ItemModel(title: "This is the second title!", isCompleted: true),
        ItemModel(title: "This is the third title!", isCompleted: false),
    ]
    
    
    
    var body: some View {
        List{
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝 ")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            ListView()
        }
        
    }
}


