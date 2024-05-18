//
//  TCCApp.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 23/04/24.
//

import SwiftUI

@main
struct TCCApp: App {
    
    @StateObject var inserirDadosViewController = InserirDadosViewController()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                MainView()
            }
        }.environmentObject(inserirDadosViewController)
    }
}
