//
//  AcronymViewModel.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/25/23.
//
//  https://www.youtube.com/watch?v=BbRvVBP24DE

import Foundation
import CloudKit
import SwiftUI

enum RecordType: String {
    case acronym = "Acronym"
}

class AcronymVM: ObservableObject {
    private var db: CKDatabase
    private var container: CKContainer
    
    @Published var acronyms: [Acronym] = []
    @Published var gameBoard: [Acronym] = []

    init(container: CKContainer) {
        self.container = container
        self.db = self.container.publicCloudDatabase
    }
    
    func saveItem(id:String, abbv:String, desc:String) {
        let record = CKRecord(recordType: RecordType.acronym.rawValue)
        let acronym = Acronym(id: id, abbreviation: abbv, description: desc)
        record.setValuesForKeys(acronym.toDictionary())
        
        self.db.save(record) { newRecord, error in
            if let error = error {
                print(error)
            } else {
                if let _ = newRecord {
                    print("saved, ok!")
                }
            }
        }
    }
    

    
    func update(acronym: Acronym) {
        
        let predicate = NSPredicate(format: "id = %@", acronym.id)
        
        let query = CKQuery(recordType: RecordType.acronym.rawValue, predicate: predicate)
        
        db.fetch(withQuery: query) { result in
            switch result {
            case .success(let result):
                result.matchResults.compactMap { $0.1 }
                    .forEach {
                        switch $0 {
                            
                            //TODO: I'm sure I can do better than remove and insert, delete and then save.
                        case .success(let record):
                            withAnimation {

                                if let index = self.acronyms.firstIndex(where: { $0.id == acronym.id }) {
                                    self.acronyms.remove(at: index)
                                    self.acronyms.insert(acronym, at: index)
                                }
                                
                                if let index = self.gameBoard.firstIndex(where: { $0.id == acronym.id }) {
                                    self.gameBoard.remove(at: index)
                                    self.gameBoard.insert(acronym, at: index)
                                }
                                
                            }
                            
                            self.db.delete(withRecordID: record.recordID) { (recordID, error) in
                                self.saveItem(id: acronym.id, abbv: acronym.abbreviation, desc: acronym.description)
                               }
                            
                        case .failure(let error):
                            print(error)
                        }
                    }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func delete(acronym: Acronym) {
        
        let predicate = NSPredicate(format: "id = %@", acronym.id)
        
        let query = CKQuery(recordType: RecordType.acronym.rawValue, predicate: predicate)
        
        db.fetch(withQuery: query) { result in
            switch result {
            case .success(let result):
                result.matchResults.compactMap { $0.1 }
                    .forEach {
                        switch $0 {
                        case .success(let record):
                            withAnimation {

                                if let index = self.acronyms.firstIndex(where: { $0.id == acronym.id }) {
                                    self.acronyms.remove(at: index)
                                }
                                
                                if let index = self.gameBoard.firstIndex(where: { $0.id == acronym.id }) {
                                    self.gameBoard.remove(at: index)
                                }
                                
                            }
                            
                            self.db.delete(withRecordID: record.recordID) { (recordID, error) in
                                
                               }
                            
                        case .failure(let error):
                            print(error)
                        }
                    }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadItems() {
        var acronyms: [Acronym] = []
        
        let query = CKQuery(recordType: RecordType.acronym.rawValue, predicate: NSPredicate(value: true))
        
        db.fetch(withQuery: query) { result in
            switch result {
            case .success(let result):
                result.matchResults.compactMap { $0.1 }
                    .forEach {
                        switch $0 {
                        case .success(let record):
                            if let acronym = Acronym.fromRecord(record) {
                                acronyms.append(acronym)
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                DispatchQueue.main.async {
                    self.acronyms = acronyms.sorted()
                    self.gameBoard = acronyms.shuffled()  //TODO: USe this instead of ASU acronyms.
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @Published var isGameStarted = false

    let boardTitle = ["B","I","N","G","O"]
    
    /// These are the winnable patterns for each index of a 5x5 BINGO board starting with top left as index zero and proceeding horizontally.
    let winningCombinations:[[Int]] = [
        //rows
        [0,1,2,3,4],
        [5,6,7,8,9],
        [10,11,12,13,14],
        [15,16,17,18,19],
        [20,21,22,23,24],
        //columns
        [0,5,10,15,20],
        [1,6,11,16,21],
        [2,7,12,17,22],
        [3,8,13,18,23],
        [4,9,14,19,24],
        //diagnals
        [0,6,12,18,24],
        [4,8,12,16,20]
    ]
    
    func shuffleBoard() {
        gameBoard = acronyms.map { $0 } //make a copy not a reference
        gameBoard = gameBoard.shuffled()
    }

    func checkForWin() {
        var selectedIndices: [Int] = []  //reset selections
        
        /// Mark all the indexes that are currently selected
        for (i, acronym) in gameBoard.enumerated()  {
            gameBoard[i].isComplete = false //reset completion status
            if acronym.isSelected {
                selectedIndices.append(i) //mark as selected
            }
        }

        for eachCombination in winningCombinations {
            /// Sets are easier to compare and more appropriate
            let winOption = Set(eachCombination)
            let selectedSet = Set(selectedIndices)

            //If we have a winning option
            if winOption.isSubset(of: selectedSet) {
                
                // Mark each winning acronym as complete!
                for i in winOption {
                    gameBoard[i].isComplete = true  //Overlays color in SwiftUI layer
                }
            }
        }
    }
}
