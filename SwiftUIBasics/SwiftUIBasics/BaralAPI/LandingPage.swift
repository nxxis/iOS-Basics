//
//  ApiTest.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 01/08/2023.
//

import SwiftUI

struct FormViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(height: 55)
            .padding(.leading)
            .frame(maxWidth: .infinity)
            .background(.gray)
            .brightness(0.3)
            .cornerRadius(10)
            .padding(.horizontal, 30)
    }
}

struct ButtonViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 80, height: 50)
            .fontWeight(.medium)
            .foregroundColor(.black)
            .background(.yellow.opacity(0.7))
            .cornerRadius(20)
            .padding()
    }
}

struct LandingPage: View {
    
    var viewModel: SignInViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Rectangle()
                    .fill(.white)
                    .frame(width: 160, height: 60)
                    .cornerRadius(20)
                    .brightness(0.1)
                    .shadow(color: .yellow.opacity(0.5), radius: 5)
                    .overlay {
                        Text("EB Pearls")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.yellow)
                    }
                
                TextField("Email", text: $email)
                    .defaultForm()
                    .padding(.top, 30)
                
                SecureField("Password", text: $password)
                    .defaultForm()
                
                HStack {
                    
        
                    NavigationLink {
                        ProfileHome(viewModel: SignInViewModel())
                    } label: {
                        Text("Login")
                            .defaultButton()
//                            .onTapGesture {
//                                viewModel.validateUser(email: email, password: password)
//                            }
                    }
                    
                    NavigationLink {
                        SignupView(viewModel: SignupViewModel())
                    } label: {
                        Text("Signup")
                            .defaultButton()
                    }
                }
            }
            .padding(.top, -100)
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage(viewModel: SignInViewModel())
    }
}
