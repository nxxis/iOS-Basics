//
//  BackgroundAndOverlay.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 24/07/2023.
//

import SwiftUI

struct BackgroundAndOverlay: View {
    
    var body: some View {
        
        Image(systemName: "heart.fill")
            .font(.system(size: 50))
            .foregroundColor(.red)
            .background(alignment: .center) {
                Circle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.white, Color.cyan]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: Color.cyan, radius: 10, x: 0, y: 10)
                    .overlay(alignment: .bottomTrailing) {
                        Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color.white, Color.pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .frame(width: 35, height: 35)
                            .shadow(color: Color.cyan.opacity(0.2), radius: 10, x: 5, y: 5)
                            .overlay {
                                Text("2")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                    }
            }
        
        
        
        
        
        
        //        Rectangle()
        //            .frame(width: 100, height: 100)
        //            .overlay {
        //                Rectangle()
        //                    .fill(Color.blue)
        //                    .frame(width: 50, height: 50)
        //            }
        //            .background {
        //                Rectangle()
        //                    .fill(.green)
        //                    .frame(width: 150, height: 150)
        //            }
        
        
        
        //        Circle()
        //            .fill(Color.gray)
        //            .frame(width: 100, height: 100)
        //            .overlay(
        //            Text("Hi")
        //                .font(.largeTitle)
        //                .foregroundColor(.white)
        //            )
        //            .background(
        //                Circle()
        //                    .fill(.green)
        //                    .frame(width: 115, height: 115)
        //            )
        
        
        //        Text("Hi this is a test")
        //            .background(
        ////                Color.red
        //                Circle()
        //                    .fill(
        //                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
        //                    .frame(width: 150, height: 150, alignment: .center)
        ////                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
        //            )
        //
        //            .background(
        //            Circle()
        //                .fill(
        //                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .trailing))
        //                .frame(width: 200, height: 200, alignment: .center)
        //            )
    }
}

struct BackgroundAndOverlay_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlay()
    }
}
