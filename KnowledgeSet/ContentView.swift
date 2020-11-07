//
//  ContentView.swift
//  KnowledgeSet
//
//  Created by Capgemini on 06/11/20.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
       LogoTile()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK:- Logo Tile

struct LogoTile: View {
    @State var height : CGFloat = 0
    var body: some View {
        
        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : (self.height == 0 ? .init() : .vertical), showsIndicators: false) {
            ZStack {
                VStack {
                    HStack (alignment: .top, spacing: 0){
                       Image("logo")
                        .offset(x: 20, y: 20)
                  }
                    .padding(.bottom, 50)
                    
                    LoginContiner()
                    RememberMeView()
                }
                
            }
        }
        
      
    }
}

// Login Continer
struct LoginContiner: View {
    @State var email = ""
    @State var pass = ""
    @State var rem = false
    @State var height : CGFloat = 0
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    
    var body: some View {
        
        VStack {
            Text("Login")
                .font(.title)
                .fontWeight(.bold)
          KNSetTextField(text: self.$userEmail, textFieldView: EmailTextView, placeholder: "Type Emp ID")
                .padding(.bottom, 40)
            KNSetTextField(text: self.$userPassword, textFieldView: PasswordTextView, placeholder: "Type Password")
            
            HStack {
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("Forget password?")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color1"))
                        .padding(.top, 16)
                }
            }.padding(.trailing, 16)
            
        }
        .foregroundColor(Color.black.opacity(0.7))
        .padding()
       // .background(Color("Color1"))
        .overlay(Rectangle().stroke(Color.black.opacity(0.03), lineWidth: 1).shadow(radius: 4))
        .padding(.horizontal)
        .padding(.top, -110)
        
    }
}

struct RememberMeView: View {
  var body: some View {
    HStack {
        HStack {
            Circle()
              .frame(width: 20, height: 20)

        Text("Remember me")
            .fontWeight(.bold)
            .foregroundColor(Color.black.opacity(0.7))
            .padding(.leading, 10)
            Spacer()
        }
           
        Button(action: {
          
        }) {
           // Spacer()
            Text("SIGNIN")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical)
                .padding(.horizontal, 35)
                .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(5)
           
        }
      }
    
   
    .padding(.top, 20)
    .padding(.leading, 20)
    .padding(.trailing, 20)
    }
}


extension LoginContiner {
    
    private var EmailTextView: some View {
        TextField("", text: $userEmail)
           .keyboardType(.emailAddress)
            .autocapitalization(.none)
    }
    private var PasswordTextView : some View {
        SecureField("", text: $userPassword)
           
    }
}
