//
//  AcronymBingoApp.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/13/23.
//
import SwiftUI
import CloudKit

@main
struct AcronymBingoApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            MainView(vm: AcronymVM())
        }
    }
}
