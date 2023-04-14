//
//  TabView.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/14/23.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            
            ListView()
                .tabItem {
                    Label("Acronyms", systemImage: "list.dash")
                }
            
            BingoView()
                .tabItem {
                    Label("Bingo", systemImage: "squareshape.split.3x3")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
