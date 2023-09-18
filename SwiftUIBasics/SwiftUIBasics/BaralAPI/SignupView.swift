//
//  SignupView.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 02/08/2023.
//

import SwiftUI

struct SignupView: View {
    
    let viewModel: SignupViewModel
    
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                    
                    Text("SIGNUP")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.yellow)
                    
                    TextField("Email", text: $email)
                        .defaultForm()
                        .padding(.top, 30)
                    
                    TextField("Username", text: $username)
                        .defaultForm()
                    
                    SecureField("Password", text: $password)
                        .defaultForm()
                    
                    Button("Signup") {
                        if email == "" && username == "" && password == "" {
                            alertTitle = "Error!"
                            alertMessage = "Please provide all the details"
                            showAlert.toggle()
                        } else {
                            
                            let user = User(email: email, username: username, password: password)
                            viewModel.UserArr.append(user)
                            viewModel.performMutation(username: username, email: email, password: password)
                            alertTitle = "Success"
                            alertMessage = "Signed up successfully"
                            showAlert.toggle()
                        }
                    }
                    .defaultButton()
                }
                .alert(isPresented: $showAlert, content: {
                    getAlert()
                })
            .padding(.top, -100)
        }

    }
    
    func getAlert() -> Alert {
        return      Alert(
            title: Text(alertTitle),
            message: Text(alertMessage),
            dismissButton: .cancel(Text("OK"), action: {
                username = ""
                email = ""
                password = ""
            }))
       
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewModel: SignupViewModel())
    }
}
