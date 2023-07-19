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
                //location 1
                Image("bg-gradient").resizable().edgesIgnoringSafeArea(.all)
                //-------------------
                VStack {
                    //location 2
                    Text("Zonify").font(.largeTitle)
                        .bold().foregroundColor(.white)
                    
                    Spacer()
                    Spacer()
                    
                    //----------------
                    //Email Field
                    //----------------
                    //location 3
                    HStack {
                        Image(systemName: "mail").foregroundColor(.white)
                        TextField("Email", text: $email).foregroundColor(.white).font(.title).fontWeight(.bold)
                        

                    }.padding().overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.white)
                    ).padding()
                    
                    //----------------
                    //Password Field
                    //----------------
                    //location 4
                    HStack {
                        Image(systemName: "lock").foregroundColor(.white)
                        TextField("Password", text: $password)
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                    }.padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2)
                                .foregroundColor(.white)
                        ).padding()
                    //----------------
                    //New Account Button
                    //----------------
                    //location 5
                    //----------------
                    //Login Button
                    //----------------
                    Button {
                        print("Button tapped!")
                    } label: {
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25)
                                .fill(.black)
                                .foregroundColor(.black)
                                .opacity(0.5)
                            ).padding(.horizontal)
                    }
                    .padding()
                    .padding(.top)
                    //----------------
                    //Spacers
                    //----------------
                    //location 6
                    Spacer()
                    Spacer()
                    
                }//End V Stack
                
                //------------------
                // location 8
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

