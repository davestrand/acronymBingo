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
    
//    static func == (lhs: Acronym, rhs: Acronym) -> Bool {
//        lhs.id == rhs.id
//    }

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
    
//    static func fetch(completion: @escaping (Result<Acronym, Error>) -> ()) {
//        let pred = NSPredicate(value: true)
//        let sort = NSSortDescriptor(key: "creationDate", ascending: false)
//        let query = CKQuery(recordType: "acronym", predicate: pred)
//        query.sortDescriptors = [sort]
//
//        let operation = CKQueryOperation(query: query)
//        operation.desiredKeys = ["text"]
//        operation.resultsLimit = 50
//        operation.queryResultBlock =
//        }
//
//        CKContainer.default().publicCloudDatabase.add(operation)
//    }
    
    static func fromRecord(_ record: CKRecord) -> Acronym? {
        guard let id = record.value(forKey: "id") as? String, let abbv = record.value(forKey: "abbreviation") as? String, let desc = record.value(forKey: "description") as? String else {
            return nil
        }
        return Acronym(id: id, abbreviation: abbv, description: desc)
    }
    
}






