//
//  RightView.swift
//  The clown returns
//
//  Created by Karson McDonald on 9/17/25.
//

import SwiftUI
import SpriteKit


struct level1_6: View {
    var body: some View {
        NavigationStack {
            GeometryReader(content: { geometry in
                SpriteView(scene: level1_6scene(size: geometry.size))
            })
            InventoryView()
            
            HStack {
                NavigationLink {
                    level1_5()
                } label: {
                    Text("<")
                }
                
                           }
                
                        }
                
                    }
            }
        
        #Preview {
            level1_6()
        }
