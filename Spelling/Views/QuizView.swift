//
//  QuizView.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: Stored properties
    
    @State var currentItem = itemsToSpell.randomElement()!
    
    @State var userGuess = ""
    
    @State var outcome: Outcome = .undetermined
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            Image(currentItem.imageName)
                .resizable()
                .scaledToFit()
            
            HStack {
                TextField("Enter the name of the item", text: $userGuess)
                    .padding(.horizontal)
                    .onKeyPress(.return) {
                        checkGuess()
                        return .handled
                    }
                    // Cannot type in text field once guess given
                    .disabled(outcome != .undetermined)
                
                Text(outcome.rawValue)
                    .frame(width: 20)
            }
            .padding()
            
            HStack {
                Spacer()
                
                Button(action: {
                    newWord()
                }, label: {
                    Text("New word")
                })
                // Disabled until a guess is given
                .disabled(outcome == .undetermined)
                
                Button(action: {
                    checkGuess()
                }, label: {
                    Text("Submit")
                })
                // Cannot check guess a second time
                .disabled(outcome != .undetermined)

            }
            .padding()
        }
        
    }
    
    // MARK: Functions
    func checkGuess() {
        if userGuess == currentItem.word {
            print("Correct")
            outcome = .correct
        } else {
            print("Incorrect")
            outcome = .incorrect
        }
    }
    
    func newWord() {
        // Reset quiz page
        userGuess = ""
        currentItem = itemsToSpell.randomElement()!
        outcome = .undetermined
    }

}

#Preview {
    QuizView()
}
