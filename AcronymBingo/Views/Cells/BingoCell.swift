//
//  BingoCell.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/13/23.
//

import SwiftUI

struct BingoCell: View {
    @ObservedObject var vm: AcronymVM

    var i: Int
    var size: CGSize
    
    var body: some View {
        ZStack(){
            
            //FIXME:  CRASH I need to bring and update the game board from the cloud data.
            Text(vm.gameBoard[i].abbreviation )
                .lineLimit(3)
                .font(.title)
                .fontDesign(.monospaced)
                .frame(width: size.width / 5.4, height: size.height / 6)
                .background(vm.gameBoard[i].isSelected ? Color("ASUGold") : Color("ASUMaroon"))
                .foregroundColor(vm.gameBoard[i].isSelected ? Color("ASUBlack") : Color("ASUWhite"))
                .padding(2)
                .cornerRadius(3)
                .onTapGesture {
                    if vm.gameBoard[i] != ASU.shared.centerAcronym {
                        vm.gameBoard[i].isSelected.toggle()
                        vm.checkForWin()
                    }
                }
            Color(vm.gameBoard[i].isComplete ? .green : .clear)
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

