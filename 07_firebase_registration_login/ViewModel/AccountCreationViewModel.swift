//
//  AccountCreationViewModel.swift
//  07_firebase_registration_login
//
//  Created by emm on 05/01/2021.
//

import SwiftUI
import Firebase

class AccountCreationViewModel: ObservableObject {
    
    // User Details...
    @Published var name = ""
    @Published var bio = ""
    @Published var age = ""
    @Published var location = ""
    
    // Login Details...
    @Published var phNumber = ""
    @Published var code = ""
    
    // reference for view changing
    // login to register to image upload
    @Published var pageNumber = 0
    
    // Images....
    @Published var images = Array(repeating: Data(count: 0), count: 4)
    @Published var picker = false
    
    // AlertView Details...
    @Published var alert = false
    @Published var alertMsg = ""
    
    // Loading Screen
    @Published var isLoading = false
    
    // OTP credentials...
    @Published var CODE = ""
    
    func login(){
        
        // getting OTP...
        // Disabling App Verification...
        // Undo it while testing with live phone...
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        isLoading.toggle()
        
        PhoneAuthProvider.provider().verifyPhoneNumber("+" + code + phNumber, uiDelegate: nil) { (CODE, err) in
          
            self.isLoading.toggle()
            if err != nil {
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            self.CODE = CODE!
            
            // Alert TextFields...
            
            let alertView = UIAlertController(title: "Verification", message: "Enter OTP Code", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
            
            let ok = UIAlertAction(title: "Ok", style: .default) { (_) in
                
                // Verifying OTP
                if let otp = alertView.textFields![0].text {
                    let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.CODE, verificationCode: otp)
                    
                    self.isLoading.toggle()
                    
                    Auth.auth().signIn(with: credential) { (res, err) in
                        
                        self.isLoading.toggle()
                        
                        if err != nil {
                            self.alertMsg = err!.localizedDescription
                            self.alert.toggle()
                            return
                        }
                        
                        // Go to Register Screen...
                        withAnimation{
                            self.pageNumber = 1
                        }
                    }
                }
                
            }
            
            alertView.addTextField { (txt) in
                txt.placeholder = "1234"
            }
            
            alertView.addAction(cancel)
            alertView.addAction(ok)
            
            // Presenting...
            UIApplication.shared.windows.first?.rootViewController?.present(alertView, animated: true, completion: nil)
        }
    }
}


