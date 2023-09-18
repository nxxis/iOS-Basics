//
//  PopUpMenue.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 02/08/2023.
//

import SwiftUI

struct PopUpMenu: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                Button("Button") {
                    withAnimation {
                        showView.toggle()
                    }
                }
                .padding(.top, 100)
                Spacer()
            }
            
            if showView {
                sheet
                    .frame(height: UIScreen.main.bounds.height * 0.25)
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private var sheet: some View {
        VStack
        {
            HStack {
                Image("zebra")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fill)
                    .padding(.top, 20)
                    .padding(.leading, 20)
                
                VStack(alignment: .leading) {
                    Text("Viida")
                        .fontWeight(.medium)
                        .padding(.top, 20)
                    
                    Text("www.viida.com")
                        .font(.footnote)
                    
                }
                Spacer()
                
                Button {
                    showView.toggle()
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.horizontal, 10)
                }
            }
            
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(maxWidth: .infinity)
                .frame(height: 1)
                .padding(.vertical, 8)
            
            Rectangle()
                .fill(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .cornerRadius(10)
                .shadow(radius: 3)
                .padding(.horizontal)
                .overlay {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .foregroundColor(.black.opacity(0.7))
                        
                        Text("help@viida.com.au")
                        Spacer()
                    }
                    .padding(.leading, 35)
                }
            Spacer()
        }
    }
}


struct PopUpMenu_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PopUpMenu()
        }
    }
}

