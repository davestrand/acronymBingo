//
//  PlayerViewModel.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/13/23.
//

import AVFoundation
import Combine

final class GameVM: ObservableObject {
    
    static let shared = GameVM()
    
    @Published var acronyms = ASU.shared.acronyms.sorted()
    
    //FIXME:  I need to bring and update the game board from the cloud data.
    @Published var board = ASU.shared.acronyms.map { $0 } //make a copy not a reference
    @Published var centerAcronym = ASU.shared.centerAcronym
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
        board = ASU.shared.acronyms.map { $0 } //make a copy not a reference
        board = board.shuffled()
    }

    func checkForWin() {
        var selectedIndices: [Int] = []  //reset selections
        
        /// Mark all the indexes that are currently selected
        for (i, acronym) in board.enumerated()  {
            board[i].isComplete = false //reset completion status
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
                    board[i].isComplete = true  //Overlays color in SwiftUI layer
                }
            }
        }
    }
}



