//
//  AnaliseDeViabilidadeView.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 23/04/24.
//

import SwiftUI
import Charts

struct AnaliseDeViabilidadeView: View {
    @Binding var selectedTab: Int
    let percentualSubstituido = 30
    let demandaAguaPluvialMensal = 4270.5
    let capacidadeReservatorio = 600
    let potencialAtendimentoMedio = 13.4
    let nMesesAtendidos = 12
    let custoReservatorio = 1500
    @EnvironmentObject var inputs: InserirDadosViewModel
    var calculosReservatorios = CalculosReservatorios()
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Simulação 1: 20% Substituição")
                    .font(.title2)
                
            }.navigationTitle(Text("Analise de Viabilidade"))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

