//
//  ContentView.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/13/23.
//

import SwiftUI

struct BingoView: View {
    
    @ObservedObject var vm: AcronymVM

    @State private var cellSize: CGSize = .zero
    @State private var selected: [Int] = []
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollView(.vertical, showsIndicators: false) {
                    Grid(alignment: .center, horizontalSpacing: 2, verticalSpacing: 2) {
                        
                        GridRow {
                            ForEach(vm.boardTitle, id: \.self) { letter in
                                TopCell(title: letter, size: cellSize)
                            }
                        }
                        
                        GridRow {
                            BingoCell(vm: vm, i:0, size: cellSize)
                            BingoCell(vm: vm, i:1, size: cellSize)
                            BingoCell(vm: vm, i:2, size: cellSize)
                            BingoCell(vm: vm, i:3, size: cellSize)
                            BingoCell(vm: vm, i:4, size: cellSize)
                        }
                        GridRow {
                            BingoCell(vm: vm, i:5, size: cellSize)
                            BingoCell(vm: vm, i:6, size: cellSize)
                            BingoCell(vm: vm, i:7, size: cellSize)
                            BingoCell(vm: vm, i:8, size: cellSize)
                            BingoCell(vm: vm, i:9, size: cellSize)
                        }
                        GridRow {
                            BingoCell(vm: vm, i:10, size: cellSize)
                            BingoCell(vm: vm, i:11, size: cellSize)
                            BingoCell(vm: vm, i:12, size: cellSize)
                            BingoCell(vm: vm, i:13, size: cellSize)
                            BingoCell(vm: vm, i:14, size: cellSize)
                        }
                        GridRow {
                            BingoCell(vm: vm, i:15, size: cellSize)
                            BingoCell(vm: vm, i:16, size: cellSize)
                            BingoCell(vm: vm, i:17, size: cellSize)
                            BingoCell(vm: vm, i:18, size: cellSize)
                            BingoCell(vm: vm, i:19, size: cellSize)
                        }
                        GridRow {
                            BingoCell(vm: vm, i:20, size: cellSize)
                            BingoCell(vm: vm, i:21, size: cellSize)
                            BingoCell(vm: vm, i:22, size: cellSize)
                            BingoCell(vm: vm, i:23, size: cellSize)
                            BingoCell(vm: vm, i:24, size: cellSize)
                        }
                    }
                }
                .onChange(of: geo.size) { _ in
                    cellSize = geo.size
                }
                .onAppear {
                    if vm.isGameStarted == false {
                        vm.shuffleBoard()
                        vm.isGameStarted = true
                    }
                    cellSize = geo.size
                }
                .toolbar {
                    Button("New Board") {
                        vm.isGameStarted = false
                        vm.shuffleBoard()
                        vm.isGameStarted = true
                    }
                }
            }
        }
    }
}
