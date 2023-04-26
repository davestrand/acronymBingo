//
//  ASU.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/13/23.
//


struct ASU: Equatable {
    static func == (lhs: ASU, rhs: ASU) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    static var shared = ASU()
    
    var id: String = "ASU_1"
    var abbreviation: String = "ASU Acronyms"
    
    var centerAcronym = Acronym(id: "free1", abbreviation: "FREE", kind: .concept, description: "Free Cell", isSelected: true)
    
    let acronyms:[Acronym] = [
 
    
    ]
}

