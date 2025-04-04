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
    
    //The List of previous results
    @State var history: [Result] = [] // empty array
    
    // Keep track of what the user selected from the picker for filtering
    @State var selectedOutcomeFilter: Outcome = .undetermind // everything
    
    // MARK: Computed properties
    var body: some View {
        
        HStack {
            
            // Left side
            VStack {
                Image(currentItem.imageName)
                    .resizable()
                    .scaledToFit()
                
                HStack{
                    TextField("Enter the name of the item", text: $userGuess)
                    
                    Text(currentOutcome.rawValue)
                }
                
                HStack {
                    
                    Button {
                        checkGuess()
                    } label: {
                        Text("Submit")
                    }
                    
                    Button {
                        newWord()
                    } label: {
                        Text("New Word")
                    }
                    
                }

            }
            .padding()
            
            // Right Side
            VStack {
                
                // Picker of select what outcome to show
                Picker("Filtering on", selection: $selectedOutcomeFilter) {
                    // Options that show up in the picker
                    Text("All results").tag(Outcome.undetermind)
                    Text("Correct").tag(Outcome.correct)
                    Text("Incorrect").tag(Outcome.incorrect)
                }
                
                //List of previous outcomes
                List(
                    
                    filtering(originalList: history, on: selectedOutcomeFilter)
                    
                    
                ) { currentResult in
                    
                    HStack{
                        
                        Image(currentResult.item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                        
                        Text(currentResult.guessProvided)
                        
                        Spacer()
                        
                        Text(currentResult.outcome.rawValue)
                        
                    }
                   
                }
               
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
    
    func newWord() {
        
        //Save the prior result
        history.insert(
            Result(
                item: currentItem,
                guessProvided: userGuess,
                outcome: currentOutcome
            ),
            at: 0
        )
        // DEBUG: What is in the array now?
        print(history)
        
        //Picks a new word
        currentItem = itemsToSpell.randomElement()!
        userGuess = ""
        currentOutcome = .undetermind
    }
    
}

#Preview {
    QuizView()
}
