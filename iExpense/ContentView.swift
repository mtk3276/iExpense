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
    
    var body: some View {
        VStack {
            Button("Show second view") {
                showingSheet.toggle()
            }
            .padding()
            .background(Color(red: 150/255, green: 200/255, blue: 200/255))
            .clipShape(Capsule())
        }
        .padding()
    }
}

struct SecondView : View {
    var body: some View {
        VStack {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
