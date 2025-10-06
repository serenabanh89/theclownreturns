//
//  RightView.swift
//  The clown returns
//
//  Created by Karson McDonald on 9/17/25.
//

import SwiftUI
import SpriteKit


struct level1_2: View {
var body: some View {
    NavigationStack {
GeometryReader(content: { geometry in
SpriteView(scene: level1_2scene(size: geometry.size))
})
        InventoryView()
        
        HStack {
            NavigationLink {
                Level1_1()
            } label: {
                Text("<")
            }
            Spacer()
            NavigationLink {
                level1_3()
            } label: {
                Text(">")
           }
            
        }
        
    }
}
}
#Preview {
    level1_2()
}
