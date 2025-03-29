//
//  Filter.swift
//  Spelling
//
//  Created by Sophie Haber on 28.03.25.
//

import Foundation

// Inputs (paramaters)
//      - the original list
//      - what outcome the user wants included
//          i.e.: undetermined (all results, incorrect, correct
//
// Output:
//      - the filtered list
func filtering(
    originalList: [Result],
    on desiredOutcome: Outcome
) -> [Result] {
    
    // When the desired outcome is indertemined, just stop
    // and return the entire original list
    if desiredOutcome == .undetermind {
        return originalList
    }
    
    // Create an empty list to populate before returning
    var filteredHistory: [Result] = [] // empty
    
    // Iterate over the entire array
    for  result in originalList {
        
        // copy any results that match the desired outcome into the new list
        if  result.outcome == desiredOutcome {
            filteredHistory.append(result)
        }
        
    }
    
    // Return only the filtered list
    return filteredHistory
    
}
