//
//  CreateAccountView.swift
//  Zonify
//

import SwiftUI

struct CreateAccountView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email = ""
    @State private var password = ""

    var body: some View {

        VStack{
            Spacer()
            //-------------------------
            // Page Title
            //-------------------------
            VStack{
                Spacer()
                Text("New Account").font(.largeTitle)
                    .bold().foregroundColor(.pink)
                    .opacity(0.8)
                Spacer()

            }// VStack page title
            Spacer()
            //-------------------------
            // Email
            //-------------------------
            VStack{
                HStack{
                    Image(systemName: "mail").foregroundColor(.gray)
                    TextField("Email", text: $email)
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }.padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 4)
                            .foregroundColor(.pink).opacity(0.8)).padding()
                //-------------------------
                // Password
                //-------------------------
                HStack{
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    TextField("Password", text: $password)
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }.padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 4)
                            .foregroundColor(.pink).opacity(0.8)
                    ).padding()
            }// Vstack email , password
            
            //-------------------------
            // Create account button
            //-------------------------
            VStack{
                Button {
                    print("Create account: \(email) \t \(password)")
                } label: {
                    Text("Create Account")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25)
                            .fill(.pink)
                            .foregroundColor(.pink)
                            .opacity(0.8)
                        ).padding(.horizontal)
                }
                .padding()
                .padding(.top)
                
                //-------------------------
                // Return Button
                //-------------------------
                
                VStack{
                    Button( action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        
                        Text("Return")
                            .foregroundColor(.gray)
                            .font(.title)
                        
                    }
                    Spacer()
                }//end of button vstack
            }
        }.background(Color.white).edgesIgnoringSafeArea(.all)//end VStack main
        
    }//end body
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
