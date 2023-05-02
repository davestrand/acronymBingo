//
//  ListView.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/14/23.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var vm: AcronymVM
    
    @State private var isAdding = false
    @State private var searchText = ""
    @State private var newAcronym: Acronym = Acronym(id: UUID().uuidString, abbreviation: "", kind: .concept, description: "")
    @State private var isShowingDetailedView = false
    @State private var selectedAcronym: Acronym = Acronym(id: UUID().uuidString, abbreviation: "", description: "")

    var searchResults: [Acronym] {
        if searchText.isEmpty {
            return vm.acronyms
        } else {
            return vm.acronyms.filter { $0.abbreviation.contains(searchText.uppercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
                VStack {
                    List {
                        
                        ForEach(searchResults, id: \.self) { a in
                            ListCell(acronym: a)
                                .onTapGesture {
                                    print("show the detailed view")
                                    selectedAcronym = Acronym(id: a.id, abbreviation: a.abbreviation, description: a.description)
                                    isShowingDetailedView = true
                                }
                                
                        }
//                        .onDelete(perform: delete)
                        .searchable(text: $searchText)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.characters)

                    }
                    .sheet(isPresented: $isShowingDetailedView) {
                        print("and we're back to the list!")
                    } content: {
                        DetailView(vm: vm, selectedAcronym: $selectedAcronym, isShowingDetailedView: $isShowingDetailedView)
                    }
                }
                .toolbar {
                    Button {
                        newAcronym = Acronym(id: UUID().uuidString, abbreviation: "", kind: .concept, description: "")
                        isAdding = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .alert("Add New Acronym", isPresented: $isAdding, actions: {
                        TextField("What is the acronym?", text: $newAcronym.abbreviation)
                            .textInputAutocapitalization(.characters)
                            .disableAutocorrection(true)

                        TextField("What does it mean?", text: $newAcronym.description)
                            .disableAutocorrection(true)

                        Button("Add", action: {
                            add(newAcronym)
                            vm.saveItem(id: newAcronym.id, abbv: newAcronym.abbreviation, desc: newAcronym.description)
                        })
                        Button("Cancel", role: .cancel, action: {})
                    }
                    )
                }
        }
    }
    
    
    
    
    func add(_ wAcronym: Acronym) {
        withAnimation {
            vm.acronyms.insert(newAcronym, at: 0)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut) {
                vm.acronyms =  vm.acronyms.sorted()
            }
        }
        
        //        withAnimation(Animation.easeIn(duration: 2).delay(1.5)) {
        //            game.acronyms =  game.acronyms.sorted()
        //        }
    }
    
//    func delete(at offsets: IndexSet) {
//        vm.acronyms.remove(atOffsets: offsets)
//    }
}
