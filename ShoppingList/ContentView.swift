//
//  ContentView.swift
//  ShoppingList
//
//  Created by Sumukha Kashyap on 16.07.24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedItems: [Bool] = Array(repeating: false, count: 100)
    @State private var listItem: String = ""

    var body: some View {
        VStack (alignment: .leading){
            
            Text("Shopping List")
                .font(.system(size: 38, weight: .semibold))
                .foregroundColor(.black)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .topLeading)
        .padding()
        
        Spacer()
        
        List{
            ForEach(0..<100, id: \.self){ index in
                HStack{
                    Circle()
                        .fill(self.selectedItems[index] ? Color.blue :Color.clear)
                        .stroke(Color.black, lineWidth:2)
                        .frame(width: 20)
                        .onTapGesture {
                            self.selectedItems[index].toggle()
                    
                    TextField(
                        " ",
                        value: $listItem,
                        format: .name(style: .medium)
                    )
                    
                }
                
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
        }.listStyle(.plain)
    
    }
    
}
    
#Preview {
        ContentView()
}
        
        
        
    
