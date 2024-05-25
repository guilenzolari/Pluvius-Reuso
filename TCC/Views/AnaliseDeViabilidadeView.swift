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
    var calculosReservatorios = CalculosReservatorios()
    
    @ObservedObject var inputs = InserirDadosViewModel.shared
    @State var dadosSimulacao: SumarioDados = SumarioDados(
        percentual: "0",
        capacidadeReservatorio: 0,
        demandaAguaPluvialMensal: 0,
        potencialMedioDeAtendimentoDaDemanda: 0,
        mesesAtendidosParcialmente: 0,
        mesesAtendidosCompletamente: 0,
        mesesNaoAtendidos: 0)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Simulação 1: 30% Substituição")
                    .font(.title2)
                Text("percentual: " + dadosSimulacao.percentual)
                Text("capacidadeReservatorio: \(String(format: "%.2f", dadosSimulacao.capacidadeReservatorio))")
                Text("demandaAguaPluvialMensal: \(String(format: "%.2f", dadosSimulacao.demandaAguaPluvialMensal))")
                Text("potencialMedioDeAtendimentoDaDemanda: \(String(format: "%.2f", dadosSimulacao.potencialMedioDeAtendimentoDaDemanda))")
                Text("mesesAtendidosParcialmente: \(String(format: "%.2f", dadosSimulacao.mesesAtendidosParcialmente))")
                Text("mesesAtendidosCompletamente: \(String(format: "%.2f", dadosSimulacao.mesesAtendidosCompletamente))")
                Text("mesesNaoAtendidos: \(String(format: "%.2f", dadosSimulacao.mesesNaoAtendidos))")
                
            }.navigationTitle(Text("Analise de Viabilidade"))
                .navigationBarTitleDisplayMode(.inline)
        }.onAppear{
            dadosSimulacao = calculosReservatorios.calculosDeTodosMeses(percentual: 0.35, volumeReservatorio: 600)
        }
    }
}

