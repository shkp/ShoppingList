//
//  AddItemView.swift
//  ShoppingList
//
//  Created by Sumukha Kashyap on 21.07.24.
//

import SwiftUI
import CoreData

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var homeViewModel: HomeViewModel
    @StateObject var articlesViewModel = DataStackModel()
    
    @State var textFieldTitle: String = ""
    @State var textFieldDescription: String = ""
    @State var textFieldQuantity: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State private var showingSheet = false
    
    var body: some View {
        VStack{
            
            Text("Add Item")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment: .leading)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 16)

                
            
            TextField("Title", text: $textFieldTitle)
                .padding()
                .frame(height: 60)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
            
            TextField("Quantity", text: $textFieldQuantity)
                .padding()
                .frame(height: 100, alignment: .top)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .textInputAutocapitalization(.sentences)
                .multilineTextAlignment(.leading)
            
            
            Button(action: {
                guard !textFieldTitle.isEmpty else {return}
                articlesViewModel.addArticle(name: textFieldTitle, quantity: textFieldQuantity)},
                   label: {
                       Text("Add")
                       .frame(height: 60)
                       .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                       .background(Color.accentColor)
                       .foregroundColor(.white)
                       .cornerRadius(16)
                }
            )
            
            Button("Dismiss") {
                    dismiss()
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.systemGray3))
                .foregroundColor(.black)
                .cornerRadius(16)
            
            
            
            
            Spacer()
                
        }
        .padding(14)
        .alert(isPresented: $showAlert, content: getAlert)
        
    }

    
    func saveButtonPressed(){
        if isFieldEmpty() == false {
            homeViewModel.addItem(title: textFieldTitle, description: textFieldDescription)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func isFieldEmpty() -> Bool{
        if textFieldTitle.count > 0{
            return false
        }
        alertTitle = "Item is empty 😵‍💫"
        showAlert.toggle()
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
        
}

#Preview {
    NavigationView{
        AddItemView()
    }
    .environmentObject(HomeViewModel())
}
