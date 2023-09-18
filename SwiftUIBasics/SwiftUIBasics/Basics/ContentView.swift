//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 24/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                
            Text("Multi line text check gardai chu".capitalized)
//                .font(.largeTitle)
                .font(.system(size: 40, weight: .medium, design: .serif))
            ///yo system wala font use garda size increase hudaina, auto size a/c to system settings
                .fontWeight(.medium)
                .foregroundColor(Color.red)
                .strikethrough(true, color: Color.black)
                .italic()
                .multilineTextAlignment(.leading)
                .baselineOffset(20) /// yesle different line bich ko spacing
                .kerning(10)
                .frame(width: 300, height: 300, alignment: .center)/// yesle letter bich ma spacing rakhcha
                .minimumScaleFactor(0.5)   /// font percentage wise ghatauni
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
