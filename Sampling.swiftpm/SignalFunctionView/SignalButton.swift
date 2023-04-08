//
//  SignalButton.swift
//  Sampling
//
//  Created by giovanni russo on 07/04/23.
//

import SwiftUI
import Foundation

struct SignalButton: View {
    
    var buttonText: String //Dynamic button text
    var simbol: String //Dynamic button simbol
    
    var body: some View {
        
            ZStack{
                //White Button
                Rectangle()
                    .frame(width: 100.0, height: 40.0)
                    .cornerRadius(5.0)
                    .foregroundColor(.white)
                    .shadow(radius: 4.0)
                
                HStack{
                    //Button Details
                    Text(buttonText)
                        .foregroundColor(.black)
                    
                    Image(systemName: simbol).foregroundColor(.black)

                }
            }
        .padding(.horizontal)
    }
}

struct SignalButton_Previews: PreviewProvider {
    static var previews: some View {
        SignalButton(buttonText: "String", simbol: "String")
    }
}
