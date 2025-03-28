//
//  QuizView.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: Stored properties
    
    // What the user is supposed to guess
    @State var currentItem = itemsToSpell.randomElement()!
    
    //What the user has guessed
    @State var userGuess = ""
    
    // what was the outcome of the user making a guess?
    @State var currentOutcome: Outcome = .undetermind
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            Image(currentItem.imageName)
                .resizable()
                .scaledToFit()
            
            HStack{
                TextField("Enter the name of the item", text: $userGuess)
                
                Text(currentOutcome.rawValue)
            }
            Button {
                checkGuess()
            } label: {
                Text("Submit")
            }

        }
        
    }
    
    // MARK: Functions
    func checkGuess() {
        if userGuess == currentItem.word {
            currentOutcome = .correct
            print("correct")
        } else {
            currentOutcome = .incorrect
            print("incorrect")
        }
    }
    
}

#Preview {
    QuizView()
}
