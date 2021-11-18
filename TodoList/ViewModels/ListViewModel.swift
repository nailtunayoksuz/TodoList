//
//  ListViewModel.swift
//  TodoList
//
//  Created by Nail Tunay ÖKSÜZ on 18.11.2021.
//

import Foundation
import SwiftUI
class ListViewModel: ObservableObject{
    
    
    
    @Published var items: [ItemModel] = []
    {
        didSet{
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init(){
        
        getItems()
    }
    
    
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey)else{
            return
        }
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)else{
            return
        }
        
        self.items = savedItems

    }
    
    func deleteIem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
        saveItems()
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
        saveItems()
    }
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        saveItems()
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateCompeltion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
