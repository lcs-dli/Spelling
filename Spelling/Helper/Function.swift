//
//  Function.swift
//  Spelling
//
//  Created by David Li on 2023-10-30.
//

import Foundation

func filtering(originalList: [Result], on desiredOutcome: Outcome) -> [Result] {
    //when the desired outcome is undertimined, jsut stop and return the original list
    if desiredOutcome == .undertemined{
        return originalList
    }
    
    var filteredResult: [Result] = []
    
    for result in originalList {
        if (result.outcome == desiredOutcome){
            filteredResult.append(result)
        }
    }
    
    return filteredResult
}
