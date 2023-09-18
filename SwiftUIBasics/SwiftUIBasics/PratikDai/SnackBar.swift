//
//  SnackBar.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 02/08/2023.
//

import SwiftUI

struct SnackBar: View {
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
                
                Button("Button") {
                    showSheet.toggle()
                }
                .font(.largeTitle)
                Spacer()
            }
        }
        
        //        ZStack {
        //            if showSheet {
        //                newView(showNewSheet: $showSheet)
        //                    .padding(.top, 100)
        //                    .transition(.move(edge: .bottom))
        //                    .animation( .spring(), value: showSheet)
        //            }
        //        }
        //        .zIndex(2.0)
        //        PresentSheet(showSheet: $showSheet)
        //                .padding(.top, 100)
        //                .offset(y: showSheet ? 0 : UIScreen.main.bounds.height)
        //                .animation(.spring(), value: showSheet)
        //                .background(.blue)
        PresentSheet()
            .sheet(isPresented: $showSheet) {
                PresentSheet()
                    .presentationDetents([.fraction(0.25)])
                    .interactiveDismissDisabled()
            }
    }
    
    struct newView : View {
        
        @Binding var showNewSheet: Bool
        
        var body: some View {
            
            ZStack() {
                Button {
                    showNewSheet.toggle()
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.horizontal, 10)
                }
            }
        }
    }
    
    
    struct PresentSheet: View {
        
        //    @Binding var showSheet: Bool
        //    @Environment(\.dismiss) var dismiss
        
        var body: some View {
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
                    //                showSheet.toggle()
                    //                dismiss.callAsFunction()
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
    
    struct SnackBar_Previews: PreviewProvider {
        static var previews: some View {
            SnackBar()
        }
    }
}
