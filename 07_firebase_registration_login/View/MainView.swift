//
//  MainView.swift
//  07_firebase_registration_login
//
//  Created by emm on 05/01/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            
            Image("heartdark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.height / 3)
                .padding(.vertical)
                .shadow(radius: 15)
                
                
            
            ZStack {
                
               // Login View...
                Login()
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("secondbg")
                            .clipShape(CustomCorner(corners: [.topLeft, .topRight]))
                            .ignoresSafeArea(.all, edges: .bottom))
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
