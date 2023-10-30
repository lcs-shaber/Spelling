//
//  Functions.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import Foundation

func filtering(originalList: [Result], on desiredOutcome: Outcome) -> [Result] {
    
    // Create a new empty list
    var filteredResults: [Result] = []
    
    // When the desired outcome is undetermined, just stop and return everything
    if desiredOutcome == .undetermined {
        return originalList
    }
    
    // Iterate over the entire original list
    for result in originalList {
        
        // Copy any results that match the desired outcome to new list
        if result.outcome == desiredOutcome {
            filteredResults.append(result)
        }
        
    }
    
    // Return only the filtered list
    return filteredResults
    
}
