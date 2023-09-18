//
//  StateBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 26/07/2023.
//

import SwiftUI

struct StateBasics: View {
    
    @State var backgroundColor: Color = Color.green
    @State var title: String = "Default Title"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(title)
                    .font(.largeTitle)
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("Button 1") {
                        backgroundColor = Color.red
                        title = "Button 1 tap gareu ta haina"
                        count+=1
                    }
                    
                    Button("Button 2") {
                        backgroundColor = Color.gray
                        title = "Button 2 pani tap garnai paryo"
                        count-=1
                    }
                }
            } .foregroundColor(.white)
        }
    }
}

struct StateBasics_Previews: PreviewProvider {
    static var previews: some View {
        StateBasics()
    }
}
