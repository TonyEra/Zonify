//
//  HomeView.swift
//  Zonify
//
//  Created by My Mac on 7/21/23.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var email: String
    
    var body: some View {
        
        Button( action: {
            print("Account Button Pressed")
        }) {
            
            Text("Return")
                .foregroundColor(.gray)
                .font(.title)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    @State static var value = ""
    static var previews: some View {
        HomeView(email:$value)
    }
}
