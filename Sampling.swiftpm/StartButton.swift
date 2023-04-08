//
//  StartButton.swift
//  Sampling
//
//  Created by giovanni russo on 03/04/23.
//
import SwiftUI
import Foundation

struct StartButton: View {
    
    @State private var fadeButton = false //Animation Variable
    
    var body: some View{
        ZStack(){
            //Effect Circumference
            Circle()
                .stroke(Color(.systemCyan), lineWidth: 3.0)
                .frame(width: 100.0, height: 100.0)
                .blur(radius: 2.0)
                .opacity(fadeButton ? 0 : 0.4)
                .scaleEffect(fadeButton ? 1.5 : 1.0)
            
            ZStack{
                //Cyan Circle
                Circle()
                    .frame(width: 100.0, height: 100.0)
                    .foregroundColor(Color(.white))
                    .shadow(radius: 1.0)
                Text("Start")
                    .font(.system(size: 16.0))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
            }
        }.onAppear{
            
            DispatchQueue.main.async {
                
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: false)){
                    
                fadeButton.toggle()
                    
                }
            }
        }
    }
    
    struct StartButton_Previews: PreviewProvider {
        static var previews: some View {
            StartButton()
        }
    }
}


