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
        ZStack{
           // Image("bg-gradient-2").resizable().edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                //-------------------------
                // Page Title
                //-------------------------
                VStack{
                    Spacer()
                    Text("Create a New Account").font(.largeTitle)
                        .bold().foregroundColor(.white)
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
                            .foregroundColor(Color.white)
                            .font(.title)
                            .fontWeight(.bold)
                    }.padding()
                        .background((Color.white).cornerRadius(10).opacity(0.75))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2)
                                .foregroundColor(.white).opacity(0.75)).padding()
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
                        .background((Color.white).cornerRadius(10).opacity(0.75))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2)
                                .foregroundColor(.white).opacity(0.75)
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
                                .fill(Color.init(hue: 0.9, saturation: 0.9, brightness: 0.8))
                                .foregroundColor(.white)
                                .opacity(1)
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
                                .foregroundColor(.white)
                                .font(.title)
                            
                        }
                        Spacer()
                    }//end of button vstack
                }
            }.background(LinearGradient(gradient: Gradient(colors:[
                Color.init(hue: 0.72, saturation: 0.8, brightness: 0.3),
                Color.init(hue: 0.72, saturation: 0.9, brightness: 0.1)]), startPoint: .top, endPoint: .bottom))
            
        }
        
    }//end body
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
