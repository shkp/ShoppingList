//
//  HomeView.swift
//  ShoppingList
//
//  Created by Sumukha Kashyap on 17.07.24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @State private var showingSheet = false
    
    var body: some View {
                List{
                    ForEach(homeViewModel.items){ item in
                        ListItemView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    homeViewModel.updateItemCompletionState(item: item)
                                }
                            }
                    }
                    .onDelete(perform: homeViewModel.deleteItem)
                    .onMove(perform: homeViewModel.moveItem)
                    .frame(maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .leading)
                    
                    
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Shopping List")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button("Add"){
                        showingSheet.toggle()
                    }.sheet(isPresented: $showingSheet, content: {
                        AddItemView()
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.visible)

                    })
                )
            }
            
        }
        

#Preview {
    NavigationView{
        HomeView()
    }
    .environmentObject(HomeViewModel())
}



