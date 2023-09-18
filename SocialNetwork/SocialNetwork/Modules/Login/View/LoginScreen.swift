//
//  LoginScreen.swift
//  SocialNetwork
//
//  Created by ebpearls on 03/08/2023.
//

import SwiftUI

// MARK: - FormViewModifier
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

// MARK: - ButtonViewModifier
struct ButtonViewModifier: ViewModifier {
    
    
    func body(content: Content) -> some View {
        content
            .frame(width: 80, height: 50)
            .foregroundColor(.black)
            .background(.yellow.opacity(0.7))
            .cornerRadius(20)
            .padding()
    }
}

struct LoginScreen: View {
    
    // MARK: - Properties
    @StateObject var viewModel: LoginViewModel
    
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
                
                TextField("Email", text: $viewModel.email)
                    .defaultForm()
                    .padding(.top, 30)
                
                SecureField("Password", text: $viewModel.password)
                    .defaultForm()
                
                HStack {
                    
                    NavigationLink("", destination: HomeScreen(viewModel: HomeViewModel()), isActive: $viewModel.isUserValid)
                    Button("Login") {
                        viewModel.validateUser()
                    }
                    .defaultButton()
                    
                    NavigationLink {
                        SignUpScreen(viewModel: SignUpViewModel())
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

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(viewModel: LoginViewModel())
    }
}
