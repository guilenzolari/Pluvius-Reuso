//
//  MainView.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 23/04/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab: Int = 0
    @ObservedObject var inputs = InserirDadosViewModel.shared
    
    var body: some View {
        TabView(selection: $selectedTab){
            InserirDadosView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Dados", systemImage: "square.and.arrow.down")}
                .tag(0)

            TemasDidaticosView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Temas Didáticos", systemImage: "book")}
                .tag(1)
        }
    }
}
