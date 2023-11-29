//
//  ItemModel.swift
//  TodoList
//
//  Created by Eunji Hwang on 24/11/2023.
//

import Foundation

// immutable struct

// 바뀔 수 없다. 절대로
// 우리는 여기있는 값은 절대 바꾸지 않는다. updateCompletion으로 바꾸지 않는 이상

// updateCompletion을 하기 위해서 작업
// id를 받아서, 새롭게 itemModel을 만들 수 있는데,
// 이렇게 하기 위해서는 생성자로 아이템을 만들때, id를 넣어서 만들 수 있도록 해야한다.
// 그래서 자동으로 id가 만들어지게 하는게 아닌, id가 있으면, 그 id로 만들고
// 그렇지 않다면, uuid를 만들어서 넣을 수 있도록 한다.

struct ItemModel: Identifiable, Codable {
    // to make it identifiable
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

/**
 새로 만들 때
 ItemModel(title: <#T##String#>, isCompleted: <#T##Bool#>)
 
 업데이트 시 id는 유지하고 새로운 item을 만들고 싶을 때
 ItemModel(id: <#T##String#>, title: <#T##String#>, isCompleted: <#T##Bool#>)
 */


