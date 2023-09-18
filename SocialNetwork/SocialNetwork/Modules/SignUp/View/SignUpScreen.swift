//
//  SignUpScreen.swift
//  SocialNetwork
//
//  Created by ebpearls on 03/08/2023.
//

import SwiftUI

struct SignUpScreen: View {
    
    // MARK: - Properties
    @StateObject var viewModel: SignUpViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("SIGNUP")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.yellow)
                
                TextField("Email", text: $viewModel.email)
                    .defaultForm()
                    .padding(.top, 30)
                
                TextField("Username", text: $viewModel.username)
                    .defaultForm()
                
                SecureField("Password", text: $viewModel.password)
                    .defaultForm()
                
                Button("Signup") {
                    viewModel.createUser()
                }
                .defaultButton()
                .disabled(viewModel.email.isEmpty && viewModel.username.isEmpty && viewModel.password.isEmpty)
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                getAlert()
            })
            .padding(.top, -100)
        }
        
    }
    
    // MARK: - getAlert
    func getAlert() -> Alert {
        return      Alert(
            title: Text(viewModel.alertTitle),
            message: Text(viewModel.alertMessage),
            dismissButton: .cancel(Text("OK"), action: {
                viewModel.username = ""
                viewModel.email = ""
                viewModel.password = ""
            }))
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen(viewModel: SignUpViewModel())
    }
}
