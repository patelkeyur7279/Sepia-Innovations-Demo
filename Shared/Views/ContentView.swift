//
//  ContentView.swift
//  Shared
//
//  Created by Keyur Patel on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.pets, id: \.self) { pet in
                NavigationLink {
                    PetDetailsWebView(url: pet.content_url)
                        .navigationTitle(pet.title)
                } label: {
                    PetListChildView(pet: pet)
                }
            }
        }
        .navigationTitle("Pets")
        .alert(isPresented: $viewModel.isTimeOut) {
            Alert(title: Text("Important message"),
                  message: Text("Working Hours Finished..!!"),
                  dismissButton: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
