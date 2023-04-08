//
//  SamplingView.swift
//  Sampling
//
//  Created by giovanni russo on 03/04/23.
//

import SwiftUI
import Foundation

struct SamplingView: View {
    
    @State private var selectedSignal: Int = 1 //Picker selection
    
    @State var signal = generateSignal()
    @State var sampleRate = 1000.5
    @State var amplitude: CGFloat = 0
    
    @State var showControls = false //Show plot control panel
    @State var buttonToggleSin = false //Sin Button selected control
    @State var buttonToggleRect = false //Rect Button selected control
    @State var buttonToggleTri = false //Triang Button selected control

    var body: some View {
        
        ScrollView{
        
                VStack {
                    
                    Text("The Sampling")
                        .padding()
                        .font(.title)
                    
                    Picker(selection: $selectedSignal, label: Text("")) {
                        Text("Continuous Signal").tag(1)
                        Text("Discrete Signal").tag(2)
                    }.pickerStyle(.segmented)
                        .padding()
                    
                    Text("**Sample Rate Controller**")
                    
                    Slider(
                        value: $sampleRate,
                        in: 1...400,
                        step: 5,
                        onEditingChanged: { _ in },
                        minimumValueLabel: Text("1 kHz"),
                        maximumValueLabel: Text("40 kHz")
                    ) {}
                        .tint(Color(.systemCyan))
                        .padding()
                    
                    if showControls {
                        
                        HStack{
                            
                            //MARK: Sin Button
                            
                            SignalButton(buttonText: "Sin", simbol: "waveform")
                                .onTapGesture {
                                    
                                    signal = generateSignal()
                                    buttonToggleSin.toggle()
                                    buttonToggleRect = false
                                    buttonToggleTri = false
                                    
                                }.padding()
                                .shadow(color: buttonToggleSin ?  .accentColor : .primary,radius: 0.2)
                            
                            //MARK: Rect Button
                            
                            SignalButton(buttonText: "Rect", simbol: "align.vertical.bottom.fill")
                                .onTapGesture {
                                    
                                    signal = generateRectSignal()
                                    buttonToggleRect.toggle()
                                    buttonToggleTri = false
                                    buttonToggleSin = false
                                    
                                }.padding()
                                .shadow(color: buttonToggleRect ?  .accentColor : .primary,radius: 0.2)
                            
                            //MARK: Triangle Button
                                
                            SignalButton(buttonText: "Triangle", simbol: "waveform.path.ecg")
                                .onTapGesture {
                                    
                                    signal = generateTriangularSignal()
                                    buttonToggleTri.toggle()
                                    buttonToggleRect = false
                                    buttonToggleSin = false
                                    
                                }.padding()
                                .shadow(color: buttonToggleTri ?  .accentColor : .primary,radius: 0.2)
                        }// End HStack
                    }// EndIf

                    if selectedSignal == 2 {
                        //Signal Check
                        DiscreteSignalView(signal: signal, sampleRate: sampleRate)
                            .frame(height: 600)
                            .padding()
                        
                    }else{
                        
                        SignalView(signal: signal, sampleRate: sampleRate, amplitude: amplitude)
                            .frame(height: 600)
                            .padding()
                    }
                    
                    //MARK: Start Button
                    
                    StartButton()
                        .padding()
                        .onTapGesture {
                            withAnimation(.linear(duration: 3.0)) {
                                amplitude = 1
                                sampleRate = 50.0
                                showControls = true //Show plot control buttons
                            }
                        }
                }
        }// End ScrollView
    }
}

struct SamplingView_Previews: PreviewProvider {
    static var previews: some View {
        SamplingView()
    }
}
