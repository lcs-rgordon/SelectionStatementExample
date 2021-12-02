//
//  ContentView.swift
//  SelectionStatementExample
//
//  Created by Russell Gordon on 2021-12-02.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    // The current guess of the user
    @State var currentGuess: Double = 50.0
    
    // The target that we are trying to guess
    // Will produce an integer in the range 1 to 100, inclusive
    let target = Int.random(in: 1...100)
    
    // The feedback to the user as they play
    @State var feedback = ""    // No hint to start the game
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            Slider(value: $currentGuess,
                   in: 0.0...100.0,
                   step: 1.0,
                   label: {
                        Text("Guess")
            },
                   minimumValueLabel: {
                        Text("0")
            },
                   maximumValueLabel: {
                        Text("100")
            })
            
            Text("\(String(format: "%.0f", currentGuess))")
                .font(.largeTitle)
                .bold()
            
            Button(action: {

                // Make the user's guess into an integer
                let currentGuessAsInteger = Int(currentGuess)
                
                // Compare the user's current guess to the target
                if currentGuessAsInteger < target {
                    feedback = "Guess higher next time!"
                } else if currentGuessAsInteger > target {
                    feedback = "Guess lower next time."
                } else {
                    feedback = "You got it!"
                }
                
            }, label: {
                Text("Submit Guess")
            })
            .buttonStyle(.bordered)
            
            Text("The super secret target is \(target)")
                .padding()
            
            Text(feedback)
                .italic()
                .padding()
            
            Spacer()

        }
        .navigationTitle("Guessing Game")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
