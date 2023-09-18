//
//  SheetsBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 27/07/2023.
//

import SwiftUI

struct SheetsBasics: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.gray
            .ignoresSafeArea()
            Button {
                showSheet.toggle()
            } label: {
                Text("Button")
                    .foregroundColor(.blue)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(20)
            }
//            .fullScreenCover(isPresented: $showSheet, content: {
//                SheetScreen()
//            })
//
            .sheet(isPresented: $showSheet) {
                SheetScreen()
            }
        }
    }
}


struct SheetScreen: View {
    
    @Environment(\.dismiss) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.gray
            .ignoresSafeArea()
            Button {
                presentationMode.callAsFunction()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }
        }
    }
}

struct SheetsBasics_Previews: PreviewProvider {
    static var previews: some View {
        SheetsBasics()
        SheetScreen()
    }
}


