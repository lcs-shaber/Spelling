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
                
                Text(outcome.rawValue)
                    .frame(width: 20)
            }
            .padding()
            
            HStack {
                Spacer()
                
                Button(action: {
                    checkGuess()
                }, label: {
                    Text("Submit")
                })
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
}

#Preview {
    QuizView()
}
