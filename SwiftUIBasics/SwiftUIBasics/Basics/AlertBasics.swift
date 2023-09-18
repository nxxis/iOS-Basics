//
//  AlertBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 27/07/2023.
//

import SwiftUI

struct AlertBasics: View {
    
    @State var showAlert: Bool = false
    @State var backgroundColor: Color = Color.gray
    
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    
    var body: some View {
        
        ZStack {
            
            backgroundColor.ignoresSafeArea()
            
            VStack {
                Button("Button") {
                    alertTitle = "Error"
                    alertMessage = "Enter proper value"
                    showAlert.toggle()
                }
                .foregroundColor(.white)
                .font(.largeTitle)
                
                Button("Button 2") {
                    alertTitle = "Scam!"
                    alertMessage = "You're scammed!!"
                    showAlert.toggle()
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
            .alert(isPresented: $showAlert) {
                getAlert()
            }
        }
    }
    
    func getAlert() -> Alert {
        return      Alert(
            title: Text(alertTitle),
            message: Text(alertMessage),
            dismissButton: .default(Text("OK")))
    }
}

struct AlertBasics_Previews: PreviewProvider {
    static var previews: some View {
        AlertBasics()
    }
}
