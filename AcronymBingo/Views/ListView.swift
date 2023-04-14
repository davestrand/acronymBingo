//
//  ListView.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/14/23.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var game = GameVM.shared
    @State private var isAdding = false
    @State private var searchText = ""
    @State private var newAcronym: Acronym = Acronym(id: UUID().uuidString, title: "", kind: .concept, meaning: "")
    
    var body: some View {
        NavigationStack {

                List {

                    ForEach(searchResults, id: \.self) { a in
                        ListCell(acronym: a)
                    }
                    .onDelete(perform: delete)
                    .searchable(text: $searchText)

                }
                .toolbar {

                    Button {
                        newAcronym = Acronym(id: UUID().uuidString, title: "", kind: .concept, meaning: "")
                        isAdding = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .alert("Add New Acronym", isPresented: $isAdding, actions: {
                        TextField("What is the acronym?", text: $newAcronym.title)
                        TextField("What does it mean?", text: $newAcronym.meaning)
                        
                        Button("Add", action: {add(newAcronym)})
                        Button("Cancel", role: .cancel, action: {})
                            }
                    )
                }
        }
    }
    
    
    var searchResults: [Acronym] {
        if searchText.isEmpty {
            return game.acronyms
        } else {
            return game.acronyms.filter { $0.title.contains(searchText) }
        }
    }
    
    func add(_ wAcronym: Acronym) {
        withAnimation {
            game.acronyms.insert(newAcronym, at: 0)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut) {
                game.acronyms =  game.acronyms.sorted()
            }
        }

//        withAnimation(Animation.easeIn(duration: 2).delay(1.5)) {
//            game.acronyms =  game.acronyms.sorted()
//        }
    }
    
        func delete(at offsets: IndexSet) {
            game.acronyms.remove(atOffsets: offsets)
        }
}
