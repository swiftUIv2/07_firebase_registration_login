//
//  Login.swift
//  07_firebase_registration_login
//
//  Created by emm on 05/01/2021.
//

import SwiftUI

struct Login: View {
    
    @EnvironmentObject var accountCreation: AccountCreationViewModel
    
    init(){
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            
            Text("Login")
                .font(.largeTitle)
                .foregroundColor(.primary)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 30)
            
            HStack(spacing: 15) {
                TextField("+1", text: $accountCreation.code)
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .frame(width: 60)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.primary.opacity(0.05), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.primary.opacity(0.05), radius: 5, x: -5, y: -5)
                    
                
                TextField("Mobile Number", text: $accountCreation.phNumber)
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.primary.opacity(0.05), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.primary.opacity(0.05), radius: 5, x: -5, y: -5)
                    
            }
            .padding(.top)
            
            Button(action: accountCreation.login, label: {
                HStack {
                    Spacer()
                    Text("Login")
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(Color("bg"))
                .cornerRadius(8)
            })
            .padding(.top)
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
