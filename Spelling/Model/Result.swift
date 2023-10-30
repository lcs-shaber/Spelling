//
//  Result.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import Foundation

struct Result: Identifiable {
    
    let id = UUID()
    let item: Item
    let guessProvided: String
    let outcome: Outcome
    
}
