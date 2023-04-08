//
//  CartesianView.swift
//  Sampling
//
//  Created by giovanni russo on 03/04/23.
//

import SwiftUI
import Foundation

struct CartesianView: View {
    var body: some View {
        
        ZStack {
            
            GeometryReader { geometry in
                
                Path { path in
                    // Draw X Axis
                    path.move(to: CGPoint(x: 0, y: geometry.size.height/2))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height/2))
                    
                    // Draw Y Axis
                    path.move(to: CGPoint(x: geometry.size.width/2, y: 0))
                    path.addLine(to: CGPoint(x: geometry.size.width/2, y: geometry.size.height))
                }
                .stroke(lineWidth: 2)
            }
        }
    }
}

struct CartesianView_Previews: PreviewProvider {
    static var previews: some View {
        CartesianView()
    }
}

