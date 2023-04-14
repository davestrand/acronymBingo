//
//  ContentView.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/13/23.
//

import SwiftUI

struct BingoView: View {
    
    @StateObject private var game = GameVM.shared
    @State private var cellSize: CGSize = .zero
    @State private var selected: [Int] = []
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollView(.vertical, showsIndicators: false) {
                    Grid(alignment: .center, horizontalSpacing: 2, verticalSpacing: 2) {
                        
                        GridRow {
                            ForEach(game.boardTitle, id: \.self) { letter in
                                TopCell(title: letter, size: cellSize)
                            }
                        }
                        
                        GridRow {
                            BingoCell(i:0, size: cellSize)
                            BingoCell(i:1, size: cellSize)
                            BingoCell(i:2, size: cellSize)
                            BingoCell(i:3, size: cellSize)
                            BingoCell(i:4, size: cellSize)
                        }
                        GridRow {
                            BingoCell(i:5, size: cellSize)
                            BingoCell(i:6, size: cellSize)
                            BingoCell(i:7, size: cellSize)
                            BingoCell(i:8, size: cellSize)
                            BingoCell(i:9, size: cellSize)
                        }
                        GridRow {
                            BingoCell(i:10, size: cellSize)
                            BingoCell(i:11, size: cellSize)
                            BingoCell(i:12, size: cellSize)
                            BingoCell(i:13, size: cellSize)
                            BingoCell(i:14, size: cellSize)
                        }
                        GridRow {
                            BingoCell(i:15, size: cellSize)
                            BingoCell(i:16, size: cellSize)
                            BingoCell(i:17, size: cellSize)
                            BingoCell(i:18, size: cellSize)
                            BingoCell(i:19, size: cellSize)
                        }
                        GridRow {
                            BingoCell(i:20, size: cellSize)
                            BingoCell(i:21, size: cellSize)
                            BingoCell(i:22, size: cellSize)
                            BingoCell(i:23, size: cellSize)
                            BingoCell(i:24, size: cellSize)
                        }
                    }
                }
                .onChange(of: geo.size) { _ in
                    cellSize = geo.size
                }
                .onAppear {
                    if game.isGameStarted == false {
                        game.shuffleBoard()
                        game.isGameStarted = true
                    }
                    cellSize = geo.size
                }
                .toolbar {
                    Button("New Board") {
                        game.isGameStarted = false
                        game.shuffleBoard()
                        game.isGameStarted = true
                    }
                }
            }
        }
    }
}
