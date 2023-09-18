//
//  BindingBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 26/07/2023.
//

import SwiftUI

struct BindingBasics: View {
    
    @State var backgroundColor: Color = Color.gray
    @State var title: String =  "Title"
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

struct BindingBasics_Previews: PreviewProvider {
    static var previews: some View {
        BindingBasics()
    }
}

struct ButtonView: View {
    
    @State var buttonColor: Color = Color.red
    @Binding var backgroundColor: Color
    @Binding var title: String
    
    var body: some View {
        Button {
            backgroundColor = Color.yellow
            buttonColor = Color.blue
            title = "Chyallo"
            
        } label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal, 10)
                .background(buttonColor)
                .cornerRadius(20)
                .shadow(radius: 10)
        }
    }
}
