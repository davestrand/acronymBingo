//
//  BingoCell.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/13/23.
//

import SwiftUI

struct BingoCell: View {
    @ObservedObject var game = GameVM.shared
    
    var i: Int
    var size: CGSize
    
    var body: some View {
        ZStack(){
            Text(game.board[i].title)
                .lineLimit(3)
                .font(.title)
                .fontDesign(.monospaced)
                .frame(width: size.width / 5.4, height: size.height / 6)
                .background(game.board[i].isSelected ? Color("ASUGold") : Color("ASUMaroon"))
                .foregroundColor(game.board[i].isSelected ? Color("ASUBlack") : Color("ASUWhite"))
                .padding(2)
                .cornerRadius(3)
                .onTapGesture {
                    if game.board[i] != ASU.shared.centerAcronym {
                        game.board[i].isSelected.toggle()
                        game.checkForWin()
                    }
                }
            Color(game.board[i].isComplete ? .green : .clear)
                .opacity(0.5)
                .allowsHitTesting(false)
        }
    }
    
}

struct TopCell: View {
    
    var title: String
    var size: CGSize
    
    var body: some View {
        Text(title)
            .lineLimit(3)
            .font(.title)
            .fontDesign(.monospaced)
            .frame(width: size.width / 10.4, height: size.height / 12)
            .background(.clear)
            .foregroundColor(Color("ASUBlack"))
            .padding(2)
            .cornerRadius(3)
  
    }
}

