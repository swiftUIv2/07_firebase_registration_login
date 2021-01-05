//
//  CustomCorner.swift
//  07_firebase_registration_login
//
//  Created by emm on 05/01/2021.
//

import SwiftUI

struct CustomCorner: Shape {
    
    var corners : UIRectCorner
    
    func path(in rect: CGRect)-> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 30, height: 30))
        return Path(path.cgPath)
    }
}

