//
//  ContentView.swift
//  07_firebase_registration_login
//
//  Created by emm on 05/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var accountCreation = AccountCreationViewModel()
    
    var body: some View {
        MainView()
        // setting it as environment Object
        // so that we can use it in all the sub Views...
            .environmentObject(accountCreation)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
