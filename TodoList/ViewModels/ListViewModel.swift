//
//  ListViewModel.swift
//  TodoList
//
//  Created by Eunji Hwang on 25/11/2023.
//

import Foundation
/**
 CRUD FUNCTIONS

 Create
 Read
 Update
 Delete

 */

class ListViewModel:ObservableObject {

    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
    
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItem
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    /**
     // because we need to keep the item's id
     // 만약 새롭게 item을 만들 경우 (title 같게 하고 isCompleted만 다르게 하려고 한다?) -> 새로운 ID를 생성하기 때문에
     // 그래서 우리는 id와 title은 같게 하되 isCompleted만 다르게 해야 한다.
     //  item model 자체에서 그것을 할 수 있다면 좋지 않을까?
     */
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        // 성공시 json 데이터가 된다.
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
