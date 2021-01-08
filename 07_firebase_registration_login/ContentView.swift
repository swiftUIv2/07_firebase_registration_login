//
//  ContentView.swift
//  07_firebase_registration_login
//
//  Created by emm on 05/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var accountCreation = AccountCreationViewModel()
    @AppStorage("Log_Status") var status = false
    
    var body: some View {
        NavigationView {
            if status {
                Text("Logged Successfully")
                    .navigationTitle("Home")
            } else {
                ZStack {
                    MainView()
                    // setting it as environment Object
                    // so that we can use it in all the sub Views...
                        .environmentObject(accountCreation)
                    
                    if accountCreation.isLoading {
                        
                        LoadingScreen()
                    }
                }
                .navigationTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
