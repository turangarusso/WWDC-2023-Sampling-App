import SwiftUI
import Foundation

struct ContentView: View {
    
    var signal = generateSignal()
    //Starting Signal

    var body: some View {
        
        NavigationView{
            
            ScrollView{
                
                VStack(spacing: 10.0) {
                    
                    Text("What is a signal?")
                        .font(.title)
                        .padding()
                    
                    Text("A signal is an event that conveys information content. So a signal is a mathematical or physical function that carries information from one point to another. With reference to the states that the signal can assume in a given time interval, we distinguish two types of signal:").padding()
                        .multilineTextAlignment(.center)
                    
                    HStack(alignment: .center){
                        
                        Text("**Analog Signal**")
                            .padding()
                        
                        Text("**Digital signal**")
                            .padding()
                        
                    }.padding()
                    
                    Text("**An analog signal** can assume all values in a certain range. A simple analog signal is a sine wave, so we are talking about a continuous time signal.").padding()
                        .multilineTextAlignment(.center)
                    
                    SignalView(signal: signal, sampleRate: 1000.0, amplitude: 1)
                        .frame(width: 600, height: 250)
                        .padding()
                    
                    Text("**The digital signal** is a discrete, non continuous time signal. A digital signal can assume as value 0 or 1 and carries information or data in binary form, i.e. a digital signal represents information in the form of bits.")
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    DiscreteSignalView(signal: signal, sampleRate: 20.0)
                        .frame(width: 600, height: 250)
                        .padding()
                    
                    Text("Now that we understand the difference between a continuous time analog signal and a discrete time digital signal, let's move on to the next step.").padding()
                        .multilineTextAlignment(.center)
                    
                    //MARK: NavigationButton
                    
                    NavigationLink{
                        
                        ConversionView()
                        
                    }label: {
                        
                        NextButton()
                            .padding()
                    }
                    
                }.padding()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

