//
//  ListTask.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 26/07/2023.
//

import SwiftUI

struct Animal {
    let id = UUID()
    let name: String
    let image: String
    let description: String
}

struct ListTask: View {
    
    var animalArr: [Animal] = [Animal(name: "Zebra", image: "zebra", description: "Each zebra has it's unique pattern of distinctive"),
                               Animal(name: "Elephant", image: "elephant", description: "Elephants are the larest land mammals on earth"),
                               Animal(name: "Giraffe", image: "giraffe", description: "At an average height of around 5 m (16-18 ft.), the ")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(animalArr, id: \.id) { index in
                    HStack {
                        Image(index.image)
                            .resizable()
                            .frame(width: 120, height: 120, alignment: .leading)
                            .cornerRadius(20)
                            .aspectRatio(contentMode: .fill)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(index.name)
                                .font(.title)
                                .fontWeight(.heavy)
                                .padding(.leading, 10)
                                .foregroundColor(.yellow)
                            
                            Text(index.description)
                                .padding(.leading, 10)
                                .lineLimit(2)
                        }
                        
                        Image(systemName: "chevron.right")
                    }
                }
            }.navigationTitle("Africa")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ListTask_Previews: PreviewProvider {
    static var previews: some View {
        ListTask()
    }
}

