//
//  Acronym.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/13/23.
//

import SwiftUI
import CloudKit

struct Acronym: Equatable, Comparable, Hashable {
    
    static func < (lhs: Acronym, rhs: Acronym) -> Bool {
        lhs.abbreviation < rhs.abbreviation
    }

    //var recordId: CKRecord.ID
    var id: String
    var abbreviation: String
    var kind: Kind?
    var description: String
    var isSelected: Bool = false
    var isComplete: Bool = false
    
    static var stored: Acronym = Acronym(id: "", abbreviation: "", description: "")
    
    enum Kind: String {
        case software = "Software"
        case jira = "Jira-related"
        case people = "People"
        case place = "Place"
        case concept = "Concept"
    }
    
    func toDictionary() -> [String: Any] {
        return ["id": id, "abbreviation": abbreviation, "description": description]
    }
    
    
    static func fromRecord(_ record: CKRecord) -> Acronym? {
        guard let id = record.value(forKey: "id") as? String, let abbv = record.value(forKey: "abbreviation") as? String, let desc = record.value(forKey: "description") as? String else {
            return nil
        }
        return Acronym(id: id, abbreviation: abbv, description: desc)
    }
    
}


