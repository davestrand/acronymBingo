//
//  Acronym.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/13/23.
//

import SwiftUI

struct Acronym: Equatable, Comparable, Hashable {
    static func < (lhs: Acronym, rhs: Acronym) -> Bool {
        lhs.title < rhs.title
    }
    
    
    var id: String
    var title: String
    var kind: Kind
    var meaning: String
    var urlString: String?
    var isSelected: Bool = false
    var isComplete: Bool = false

    enum Kind: String {
        case software = "Software"
        case jira = "Jira-related"
        case people = "People"
        case place = "Place"
        case concept = "Concept"
    }
    
    
}




