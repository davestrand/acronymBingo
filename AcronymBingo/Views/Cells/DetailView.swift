//
//  AcronymDetailView.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/26/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var vm: AcronymVM
    @Binding var selectedAcronym: Acronym
    @Binding var isShowingDetailedView: Bool

    var body: some View {
        VStack {
            TextField("Abbreviation", text: $selectedAcronym.abbreviation)
                .textFieldStyle(.roundedBorder)
                .font(.largeTitle)
                .textCase(.uppercase)
                .textInputAutocapitalization(.characters)
                .disableAutocorrection(true)
                
            TextField("Description", text: $selectedAcronym.description, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .font(.body)
                .disableAutocorrection(true)
               
            
            //Text(selectedAcronym.id)
            
            Button("SAVE") {
                print("update")
                vm.update(acronym: selectedAcronym)
                isShowingDetailedView = false
            }
            .buttonStyle(.borderedProminent)
            .padding()

            
            Button("DELETE") {
                print("delete")
                vm.delete(acronym: selectedAcronym)
                isShowingDetailedView = false
            }
            .buttonStyle(.borderedProminent)
            .padding()

        }.padding()
        
//        Text(selectedAcronym.abbreviation).font(.largeTitle)
//        Text(selectedAcronym.description)
    }
}

