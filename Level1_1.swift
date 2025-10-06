//
//  ContentView.swift
//  The clown returns
//
//  Created by Karson McDonald on 9/9/25.
//

import SwiftUI
import SpriteKit


struct Level1_1: View {
    
    @State var count = 0
    
var body: some View {
    NavigationStack {
        
GeometryReader(content: { geometry in
    SpriteView(scene: level1_1scene(size: geometry.size))
//        .overlay(
//            HStack {
//                    Button {
//                        count += 1
//                    } label: {
//                        Text("regular")
//                    }
//                    //.frame(width: geometry.size.width / 4, height: 100)
//                    .background(.green)
//                    
//                    Text("\(count)")
//
//                }
//        )
    
})
        InventoryView()
        

            Spacer()
            NavigationLink {
                level1_2()
            } label: {
                Text(">")
            }
            
        }
        
    }
}

#Preview {
    Level1_1()
}
