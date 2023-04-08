//
//  NextButton.swift
//  Sampling
//
//  Created by giovanni russo on 04/04/23.
//

import SwiftUI
import Foundation

struct NextButton: View {
    
    @State private var fadeButton = false //Animation Variable
    
    var body: some View {
        ZStack{
            //Fade Effect
            Rectangle()
                .stroke(Color(.systemCyan), lineWidth: 9.0)
                .frame(width: 130.0, height: 40.0)
                .cornerRadius(5.0)
                .blur(radius: 2.0)
                .opacity(fadeButton ? 0 : 0.4)
                .scaleEffect(fadeButton ? 1.5 : 1.0)
            
                //White Button
                Rectangle()
                    .frame(width: 130.0, height: 40.0)
                    .cornerRadius(5.0)
                    .foregroundColor(.white)
                    .shadow(radius: 8.0)
                    .overlay(){
                        HStack{
                            //Button Details
                            Text("Next")
                                .foregroundColor(.black)
                            
                            Image(systemName: "arrow.right").foregroundColor(.black)
                            
                        }
                    }//End Overlay
        }.onAppear{
            //Animation Control
            DispatchQueue.main.async {
                
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: false)){
                    
                fadeButton.toggle()
                    
                }
            }
        }
    }//End Body
    
    struct NextButton_Previews: PreviewProvider {
        static var previews: some View {
            NextButton()
        }
    }
}
