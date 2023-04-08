//
//  SignalView.swift
//  Sampling
//
//  Created by giovanni russo on 03/04/23.
//

import SwiftUI
import Foundation

func generateSignal() -> [Double] {
    //Draw the Sin signal
    var signal: [Double] = []
    
    for i in 0..<360 {
        
        let value = sin(Double(i) * Double.pi / 180.0)
        signal.append(value)
        
    }
    return signal
}

func generateTriangularSignal() -> [Double] {
    //Draw Triangular signal
    var signal: [Double] = []
    
    for i in 0..<360 {
        
        let value = 1.0 - (abs(Double(i % 360 - 180)) / 180.0) * 2.0
        signal.append(value)
        
    }
    return signal
}

func generateRectSignal() -> [Double] {
    // Draw Rect signal
    var signal: [Double] = []
    
    let numPointsPerHalfCycle = 150 //Number of points
    
    for i in 0..<360 {
        
        if i < numPointsPerHalfCycle {
            // High signal
            signal.append(0.5)
        } else {
            // Low signal
            signal.append(0)
        }
        
    }
    return signal
}

struct SignalView: View {
    
    var signal: [Double]
    
    var sampleRate: Double
    
    var amplitude: CGFloat
    
    var body: some View {
        ZStack{
            //Cartesian View as Backgound
            CartesianView()
            
            GeometryReader { geometry in
                
                let path = Path { path in
                    
                    let dx = geometry.size.width / CGFloat(signal.count)
                    
                    let height = geometry.size.height / 2
                    
                    var x: CGFloat = 0
                    
                    path.move(to: CGPoint(x: x, y: height))
                    
                    for (i, value) in signal.enumerated() {
                        
                        let y = height - CGFloat(value) * amplitude * height
                        
                        if i % Int(sampleRate) == 0 {
                            
                            let pointRect = CGRect(x: x - 2, y: y - 2, width: 4, height: 4)
                            path.addEllipse(in: pointRect)
                        }
                        
                        if i % Int(sampleRate) == 0 {
                            
                            path.addLine(to: CGPoint(x: x, y: y))
                            path.addLine(to: CGPoint(x: x + dx, y: y))
                            
                        } else {
                            
                            path.addLine(to: CGPoint(x: x, y: y))
                            
                        }
                        
                        x += dx
                        
                    }
                }
                //MARK: Plot Color
                path.stroke(lineWidth: 2)
                    .foregroundColor(.purple)
                
            }//End Geometry
        }//End ZStack
    }
}

