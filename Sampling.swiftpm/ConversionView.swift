//
//  ConversionView.swift
//  Sampling
//
//  Created by giovanni russo on 03/04/23.
//

import SwiftUI
import Foundation

struct ConversionView: View {
    
    var signal = generateSignal()
    //Starting Signal
    
    var body: some View {
        
        ScrollView{
            
            Text("The A/D Conversion!")
                .font(.title)
                .padding()
            
            VStack(alignment: .center ,spacing: 10) {
                
                Text("In order to transmit analog data with a digital transmission, it is necessary to **transform the analog data into a digital signal**. More precisely, the analog signal, corresponding to the analog data in the base band, is represented with a numerical data.").padding()
                
                Text("The process of transforming an analog signal into digital must go through a fundamental process:")
                    .padding()
                
                HStack{
                    Spacer()
                    
                    Text("**Signal Sampling**")
                        .padding()
                    
                    Spacer()
                }
                
                Text("Sampling consists in looking at the instantaneous value of the analog signal with a certain frequency. In other words, sampling a continuous time signal means taking samples of that signal, basically points, at a certain distance from each other as in the following graph:")
                    .padding()
                    .multilineTextAlignment(.leading)
                
                HStack{
                    Spacer()
                    
                    SignalView(signal: signal, sampleRate: 30.0, amplitude: 1)
                        .frame(width: 600, height: 250)
                        .padding()
                    
                    Spacer()
                }
                
                Text("In fact, the analog signal is used to modulate the amplitude of a sequence of pulses at a fixed frequency: the resulting signal will be a sequence of pulses with an amplitude equal to the value of the analog signal corresponding to the pulses.")
                    .padding()
                
                Text("The analog to digital conversion is of fundamental importance, all the technology that we use and that we are using right now is based on this. For example, a microphone is a transducer that converts an analog signal into a digital signal.")
                    .padding()
                
                Image("microfono-carbone")
                    .resizable()
                    .frame(width: 600, height: 250)
                    .scaledToFit()
                    .padding()
                
                Text("At this point we can see together a simulation of the sampling of a signal to realize what it means and how the discrete signal changes depending on the sampling rate.").padding()
               
            }.padding()
            //End VStack
            
            //MARK: NavigationButton
            
            VStack(spacing: 10){
                
                NavigationLink{
                    
                    SamplingView()
                    
                }label: {
                    
                    NextButton()
                        .padding()
                    
                }
            }
        }//End ScrollView
    }//End Body
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView()
    }
}
