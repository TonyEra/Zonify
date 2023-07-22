//
//  AppView.swift
//  Zonify
//
//  Created by My Mac on 7/21/23.
//

import SwiftUI

struct AppView: View {
    
    @State var isLoggedIn: Bool
    @State var email: String
    
    var body: some View {
        return Group {
            if isLoggedIn {
                HomeView(email: $email)
            }
            else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    
    @State static var loggedIn = false
    @State static var email = ""
    static var previews: some View {
        AppView(isLoggedIn: loggedIn, email: email)
    }
}
