//
//  LoadingScreen.swift
//  07_firebase_registration_login
//
//  Created by emm on 07/01/2021.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        ZStack{
            Color.primary.opacity(0.2).ignoresSafeArea(.all, edges: .all)
            
            ProgressView()
                .padding(20)
                .background(Color("bg"))
                .cornerRadius(10)
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
