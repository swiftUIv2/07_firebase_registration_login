//
//  MainView.swift
//  07_firebase_registration_login
//
//  Created by emm on 05/01/2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var accountCreation: AccountCreationViewModel
    
    var body: some View {
        VStack {
            
            Image("heartdark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.height / 3)
                .padding(.vertical)
                .shadow(color: Color.primary.opacity(0.05), radius: 5, x: 5, y: 5)
                
                
            
            ZStack {
                
               // Login View...
                if accountCreation.pageNumber == 0 {
                    Login()
                }
                else if accountCreation.pageNumber == 1 {
                    Register()
                        .transition(.move(edge: .trailing))
                }
                else {
                    Register()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("secondbg")
                            .clipShape(CustomCorner(corners: [.topLeft, .topRight]))
                            .ignoresSafeArea(.all, edges: .bottom))
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        
        // alert...
        .alert(isPresented: $accountCreation.alert, content: {
            Alert(title: Text("Error"), message: Text(accountCreation.alertMsg), dismissButton: .default(Text("ok")))
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
