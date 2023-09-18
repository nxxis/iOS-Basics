//
//  ButtonsBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 26/07/2023.
//

import SwiftUI

struct ButtonsBasics: View {
    
    @State var title: String = "TITLE"
    var body: some View {
        VStack(spacing: 30) {
            Text(title)
            Button("Button") {
                self.title = "Button Tap garis haina"
            }
            .tint(.red)
            
            Button {
                self.title = "Arko buton tap garis feri"
            } label: {
                Text("Arko button".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Color.blue
                            .cornerRadius(15)
                            .shadow(radius: 5)
                     )
            }
            
            Button {
                self.title = "Button kati tap garchas hou"
            } label: {
                Circle()
                    .fill(.white)
                    .frame(width: 70, height: 70)
                    .shadow(radius: 10)
                    .overlay {
                         Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red )
                    }
            }
            
            Button {
                self.title = "vayo dai tap nagarnu"
            } label: {
                Text("Warning".uppercased())
                    .font(.caption)
                    .foregroundColor(.gray)
                    .bold()
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.red, lineWidth: 3)
//                            .fill(.white)
                            .shadow(radius: 10)
                    )
            }



        }
    }
}

struct ButtonsBasics_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsBasics()
    }
}
