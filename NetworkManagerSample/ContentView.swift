//
//  ContentView.swift
//  NetworkManagerSample
//
//  Created by Kumar, Vishwajeet on 09/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = UserViewModel(service: UserService())
    
    var body: some View {
        ScrollView {
            Text("All users")
                .font(.title)
                .bold()
            
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                    HStack(alignment:.top) {
                        Text("\(user.id)")
                        
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .bold()
                            
                            Text(user.email.lowercased())
                            
                            Text(user.phone)
                        }
                    }
                    .frame(width: 300, alignment: .leading)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                    .cornerRadius(20)
                }
            }
        }
        .padding(.vertical)
        .alert(isPresented: $viewModel.showingAlert, content: {
            Alert(title: Text("Alert"), message: Text(viewModel.alertMessage))
        })
        .onAppear {
            viewModel.getUsers()
        }
    }
}

#Preview {
    ContentView()
}
