//
//  TabView.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/14/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var vm: AcronymVM

    init(vm: AcronymVM) {
        _vm = StateObject(wrappedValue: vm)
        vm.loadItems()
    }
    
    var body: some View {
        TabView {
            
            ListView(vm: vm)
                .tabItem {
                    Label("Acronyms", systemImage: "list.dash")
                }

            BingoView(vm: vm)
                .tabItem {
                    Label("Bingo", systemImage: "squareshape.split.3x3")
                }
            
        }
    }
}


