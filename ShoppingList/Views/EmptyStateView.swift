//
//  EmptyStateView.swift
//  ShoppingList
//
//  Created by Sumukha Kashyap on 23.07.24.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Text("✅")
                .frame(width: 100, height: 100)
            
            Text("Start adding things to the list")
                .font(.title)
                .fontWeight(.light)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding()
        }
        .navigationTitle("Shopping List")
        
    }
    
}

#Preview {
    NavigationView{
        EmptyStateView()
    }
}
