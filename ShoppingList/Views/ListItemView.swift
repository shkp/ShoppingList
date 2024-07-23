//
//  ListItemView.swift
//  ShoppingList
//
//  Created by Sumukha Kashyap on 21.07.24.
//

import SwiftUI

struct ListItemView: View {

    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .black)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
        
    }
}



struct ListItemView_Previews: PreviewProvider{
    static var item1 = ItemModel(title: "Item 1", isCompleted: true)
    static var item2 = ItemModel(title: "Item 2", isCompleted: false)
    
    static var previews: some View{
        Group{
            ListItemView(item: item1)
            ListItemView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
    
}
