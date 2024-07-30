//
//  HomeView.swift
//  ShoppingList
//
//  Created by Sumukha Kashyap on 17.07.24.
//

import SwiftUI


struct HomeView: View {
    
    @State public var showingSheet = false
    @StateObject var articlesViewModel = DataStackModel()
    
    var body: some View {
        ZStack{
            if $articlesViewModel.savedArticles.isEmpty{
                EmptyStateView()
            } else {
                List{
                    ForEach(articlesViewModel.savedArticles){ entity in
                        Text(entity.name ?? "N/A")
                            .onTapGesture {
                                articlesViewModel.updateArticle(entity: entity)
                            }
                    }
                    .onDelete(perform: articlesViewModel.deleteArticle)
                
                }
                .listStyle(PlainListStyle())
            }
        }
                
                .navigationTitle("Shopping List")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button("Add"){
                        showingSheet.toggle()
                    }.sheet(isPresented: $showingSheet, onDismiss: {articlesViewModel.fetchArticles()}, content: {
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



