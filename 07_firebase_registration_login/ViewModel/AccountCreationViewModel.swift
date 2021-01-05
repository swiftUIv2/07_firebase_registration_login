//
//  AccountCreationViewModel.swift
//  07_firebase_registration_login
//
//  Created by emm on 05/01/2021.
//

import SwiftUI

class AccountCreationViewModel: ObservableObject {
    
    // User Details...
    @Published var name = ""
    @Published var bio = ""
    @Published var age = ""
    @Published var location = ""
    
    // Login Details...
    @Published var phNumber = ""
    @Published var code = ""
    }


