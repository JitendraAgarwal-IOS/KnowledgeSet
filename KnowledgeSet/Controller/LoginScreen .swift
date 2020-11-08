//
//  ContentView.swift
//  KnowledgeSet
//
//  Created by Capgemini on 06/11/20.
//

import SwiftUI

struct LoginScreen: View {
    
    @State  var isActive: Bool = false
    var height: Int?
    var body: some View {
        
        
        NavigationView {
            VStack {
                
                //  EmptyView()
                ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : (self.height == 0 ? .init() : .vertical), showsIndicators: false) {
                    
                    VStack {
                        HStack (alignment: .top, spacing: 0){
                            Image("logo")
                                .offset(x: 20, y: 20)
                        }
                        .padding(.bottom, 50)
                        
                        LoginContiner()
                        RememberMeView(showPickleEmoji: self.$isActive)
                        SocialLoginView()
                        NewUserView()
                    }
                    
                }
                NavigationLink("", destination: DashboardScreen(), isActive: self.$isActive)
            }
            
        }
        
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(height: 0)
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
    @Binding var showPickleEmoji: Bool
    var body: some View {
        
        HStack {
            
            HStack {
                Circle()
                    .stroke(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
                    .frame(width: 20, height: 20)
                
                Text("Remember me")
                    .fontWeight(.bold)
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding(.leading, 10)
                Spacer()
            }
            
            Button(action: {
                self.showPickleEmoji.toggle()
                
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

struct SocialLoginView :  View {
    
    var body: some View {
        
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.black.opacity(0.05))
                    .frame(width: 100, height: 5)
                Text("SocialLogin")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Color1"))
                Rectangle()
                    .fill(Color.black.opacity(0.05))
                    .frame(width: 100, height: 5)
                
            }
            .padding(.top)
            
            HStack(alignment: .center) {
                
                Button(action: {
                    
                }) {
                    
                    Image("fb")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 35, height: 35)
                        .padding(8)
                        //.background(Color.red)
                        .clipShape(Circle())
                    
                }
                
                Button(action: {
                    
                }) {
                    
                    Image("google")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 35, height: 35)
                        .padding(8)
                        //.background(Color.red)
                        .clipShape(Circle())
                    
                }
                
                Button(action: {
                    
                }) {
                    
                    Image("twitter")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 35, height: 35)
                        .padding(8)
                        // .background(Color.red)
                        .clipShape(Circle())
                    
                }
                
            }
            .padding(.top)
        }
        
        
        
    }
    
}
struct NewUserView :  View {
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Text("New User?")
                .fontWeight(.bold)
            Button(action: {
                
            }) {
                
                Text("SIGNUP")
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            
        }
        .padding(.top)
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


