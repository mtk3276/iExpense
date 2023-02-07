//
//  ContentView.swift
//  iExpense
//
//  Created by Muhsina Kamal on 16/01/2023.
//

import SwiftUI

class User : ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    @StateObject var user = User()
    
    @State private var showingSheet = false
    
    @State private var numbers = [Int]()
    @State private var currentSize = 0
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add row"){
                    currentSize+=1
                    numbers.append(currentSize)
                }
                .padding()
                .frame(width: 200)
                .background(Color(red: 150/255, green: 200/255, blue: 200/255))
                .clipShape(Capsule())
                
                Spacer()
                
                Button("Show second view") {
                    showingSheet.toggle()
                }
                .padding()
                .frame(width: 200)
                .background(Color(red: 150/255, green: 200/255, blue: 200/255))
                .clipShape(Capsule())
                .sheet(isPresented: $showingSheet) {
                    SecondView(user: user)
                }
            }.toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct SecondView : View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var user : User
    
    var body: some View {
        VStack {
            Spacer();Spacer();Spacer()
            Text("Hello \(user.firstName) \(user.lastName)")
            Spacer();Spacer();Spacer()
            Button("Dismiss") {
                dismiss()
            }
            .padding()
            .background(Color(red: 220/255, green:100/255, blue: 100/255))
            .foregroundColor(.white)
            .clipShape(Capsule())
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
