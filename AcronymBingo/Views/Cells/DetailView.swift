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
            
            Text(selectedAcronym.abbreviation)
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding(2)
                .background(Color("ASUGold"))
                .padding()
                
            Text(selectedAcronym.description)
                .foregroundColor(.black)
                .padding()
            
            

            //TODO: This is to enable buttons to save or delete acronyms.  For now let's just use the cloudkit dashboard so we don't have people messing up the data.  But later we can allow admin access from the app.
            
            
//
//            TextField("Abbreviation", text: $selectedAcronym.abbreviation)
//                .textFieldStyle(.roundedBorder)
//                .font(.largeTitle)
//                .textCase(.uppercase)
//                .textInputAutocapitalization(.characters)
//                .disableAutocorrection(true)
//
//            TextField("Description", text: $selectedAcronym.description, axis: .vertical)
//                .textFieldStyle(.roundedBorder)
//                .font(.body)
//                .disableAutocorrection(true)
//
            
//
//            Button("SAVE") {
//                print("update")
//                vm.update(acronym: selectedAcronym)
//                isShowingDetailedView = false
//            }
//            .buttonStyle(.borderedProminent)
//            .padding()
//
//
//            Button("DELETE") {
//                print("delete")
//                vm.delete(acronym: selectedAcronym)
//                isShowingDetailedView = false
//            }
//            .buttonStyle(.borderedProminent)
//            .padding()

        }.padding()
    }
}

