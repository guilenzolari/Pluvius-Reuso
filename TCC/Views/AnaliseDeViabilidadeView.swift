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
    @State var dadosSimulacao: DadosConsumoMes = DadosConsumoMes(
         volumeDeAguapluvialCaptada: 0,
         volumeDisponivelReservatorioPosCaptacaoPreConsumo: 0,
         demandaDeAgua: 0,
         volumeReservatorioPosConsumo: 0,
         volumeConsumido: 0,
         potencialDeAtendimentoDaDemanda: 0
     )
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Simulação 1: 30% Substituição")
                    .font(.title2)
                
                Text("volumeDeAguapluvialCaptada: \(dadosSimulacao.volumeDeAguapluvialCaptada)")
                Text("volumeDisponivelReservatorioPosCaptacaoPreConsumo: \(dadosSimulacao.volumeDisponivelReservatorioPosCaptacaoPreConsumo)")
                Text("demandaDeAgua: \(dadosSimulacao.demandaDeAgua)")
                Text("volumeReservatorioPosConsumo: \(dadosSimulacao.volumeReservatorioPosConsumo)")
                Text("volumeConsumido: \(dadosSimulacao.volumeConsumido)")
                Text("potencialDeAtendimentoDaDemanda: \(dadosSimulacao.potencialDeAtendimentoDaDemanda)")

                
            }.navigationTitle(Text("Analise de Viabilidade"))
                .navigationBarTitleDisplayMode(.inline)
        }.onAppear{
            dadosSimulacao = calculosReservatorios.calculosDoMes(
                index: 0,
                volumeReservatorio: 1000,
                percentual: 0.3)
        }
    }
}

