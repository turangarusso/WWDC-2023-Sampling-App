//
//  DiscreteSignalView.swift
//  Sampling
//
//  Created by giovanni russo on 03/04/23.
//

import SwiftUI
import Foundation

struct DiscreteSignalView: View {
    
    var signal: [Double]
    
    var sampleRate: Double
    
    var amplitude: CGFloat = 1
    
    var body: some View {
        ZStack{
            //Use Cartesian View as Backgound
            CartesianView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            GeometryReader { geometry in
                
                let dx = geometry.size.width / CGFloat(signal.count)
                
                let height = geometry.size.height / 2
                
                Path { path in
                    
                    path.move(to: CGPoint(x: 0, y: height))
                    
                    for i in 0..<signal.count {
                        
                        let x = CGFloat(i) * dx
                        
                        let y = height - CGFloat(signal[i]) * amplitude * height
                        
                        if i % Int(sampleRate) == 0 {
                            path.addLine(to: CGPoint(x: x, y: height))
                            path.addLine(to: CGPoint(x: x, y: y))
                            path.addLine(to: CGPoint(x: x + dx, y: y))
                            path.addLine(to: CGPoint(x: x + dx, y: height))
                        }
                    }
                }.stroke(lineWidth: 2)
                    .foregroundColor(Color(.systemCyan))
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
