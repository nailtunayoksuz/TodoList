//
//  ListRowView.swift
//  TodoList
//
//  Created by Nail Tunay ÖKSÜZ on 18.11.2021.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
            
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "asdasd", isCompleted: false)
    static var previews: some View {
        ListRowView(item: item1)
    }
}
