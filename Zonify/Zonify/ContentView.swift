//
//  ContentView.swift
//  Zonify
//
//  Created by My Mac on 7/19/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    // MARK: - Propertiers
    @State private var email = ""
    @State private var password = ""
      
    // MARK: - View
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
                    //location 1
                    Text("Zonify")
                        .padding(.top, 25)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.orange)
                    
                    Image(systemName: "cube.fill")
                        .resizable()
                        .foregroundColor(.orange)
                        .frame(width: 75, height: 75)
                        .opacity(0.75)
                    
                    Spacer()
                    Spacer()
                    
                    //----------------
                    //Email Field
                    //----------------
                    //location 2
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Email")
                                .font(.title)
                                .foregroundColor(.gray)
                                .padding(.trailing, 16)
                            
                            Image(systemName: "mail")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 30, height: 24)
                                .padding(.trailing, 235)
                        } // End HStack
                        
                        TextField("Enter your email address...", text: $email)
                            .textFieldStyle(.roundedBorder)
                            .font(.headline)
                            .autocapitalization(.none)
                    }.padding()
                    
                    //----------------
                    //Password Field
                    //----------------
                    //location 3
                    VStack {
                        
                        HStack {
                            
                            Text("Password")
                                .font(.title)
                                .foregroundColor(.gray)
                                .padding(.trailing, 16)
                            
                            Image(systemName: "lock")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 22, height: 25)
                                .padding(.trailing, 188)
                        } // End HStack
                        
                        SecureField("Enter your password...", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .font(.headline)
                            .autocapitalization(.none)
                    }.padding()
                    
                    //----------------
                    //New Account Button
                    //----------------
                    //location 4
                    //----------------
                    //Login Button
                    //----------------
                    Button {
                        print("Button tapped!")
                    } label: {
                        Text("Login")
                            .foregroundColor(.orange)
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12)
                                .fill(.black)
                                .opacity(0.05)
                                .overlay(RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.orange, lineWidth: 2)
                                    .opacity(0.45))
                            ).padding(.horizontal)
                    }
                    .padding()
                    .padding(.top)
                    
                    //----------------
                    //Spacers
                    //----------------
                    //location 5
                    
                    Spacer()

                    //----------------
                    //Sign Up Button
                    //----------------
                    //location 6
                    
                    VStack {

                        Text("Don't have an account?")
                            .foregroundColor(.blue)
                            .opacity(0.78)
                        
                        Button {
                            print("Button tapped!")
                        } label: {
                            Text("Sign Up")
                                .foregroundColor(.black)
                                .font(.title2)
                                .bold()
                                .frame(maxWidth: 110)
                                .opacity(0.75)
                                .padding()
                                .background(RoundedRectangle(cornerRadius:30)
                                    .stroke(Color.blue, lineWidth: 2)
                                    .opacity(0.45)
                                ).padding(.horizontal)
                        }
                    } // End VStack          
                }//End VStack
            }//End ZStack
        }
    }
    
    /**
            Preview Method
     */
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
