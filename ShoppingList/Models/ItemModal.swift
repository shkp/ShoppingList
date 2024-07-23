//
//  ItemModal.swift
//  ShoppingList
//
//  Created by Sumukha Kashyap on 21.07.24.
//

import Foundation

struct ItemModal: Identifiable{
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
