//
//  ListCell.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/14/23.
//

import SwiftUI

struct ListCell: View {
    
    var acronym: Acronym
    
    var body: some View {
            HStack{
                Text(acronym.abbreviation)
                    .lineLimit(3)
                    .font(.title)
                    .fontDesign(.monospaced)
                    .padding(2)
                    .cornerRadius(3)
                    .frame(width: 100)
                
                Text(acronym.description)
                    .lineLimit(3)
                    .font(.body)
                    .fontDesign(.monospaced)
                    .padding(2)
                    .cornerRadius(3)
                
                Spacer()
            }
            .padding(10)
            .background(Color("ASUMaroon"))
            .foregroundColor(Color("ASUWhite"))
            .border(Color.blue, width: 1)
        }
}
