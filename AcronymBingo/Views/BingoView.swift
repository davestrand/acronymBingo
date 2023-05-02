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
    @State private var searchText = ""

    var searchResults: [Acronym] {
        if searchText.isEmpty {
            return vm.gameBoard
        } else {
            return vm.gameBoard.filter {
                $0.abbreviation.contains(searchText.uppercased())
            }
        }
    }
    
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
                            BingoCell(vm: vm, searchText: $searchText, i:0, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:1, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:2, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:3, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:4, size: cellSize)
                        }
                        GridRow {
                            BingoCell(vm: vm, searchText: $searchText,i:5, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:6, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:7, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:8, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:9, size: cellSize)
                        }
                        GridRow {
                            BingoCell(vm: vm, searchText: $searchText,i:10, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:11, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:12, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:13, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:14, size: cellSize)
                        }
                        GridRow {
                            BingoCell(vm: vm, searchText: $searchText,i:15, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:16, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:17, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:18, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:19, size: cellSize)
                        }
                        GridRow {
                            BingoCell(vm: vm, searchText: $searchText,i:20, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:21, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:22, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:23, size: cellSize)
                            BingoCell(vm: vm, searchText: $searchText,i:24, size: cellSize)
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
                .searchable(text: $searchText)
            }
        }
    }
}
