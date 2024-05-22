//
//  MainView.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 23/04/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            InserirDadosView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Dados", systemImage: "square.and.arrow.down")}
                .tag(0)

            AnaliseDeViabilidadeView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Análise de Viabilidade", systemImage: "chart.line.uptrend.xyaxis")}
                .tag(1)

            InformacoesView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Informações", systemImage: "book")}
                .tag(2)
        }
    }
}

#Preview {
    MainView().environmentObject(InserirDadosViewModel())
}
