//
//  DetalhesSimulaçãoVi.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 27/05/24.
//

import SwiftUI

struct DetalhesSimulacaoView: View {
    @State var dado: SumarioDados
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Spacer()
                    .frame(height: getWidth()/18)
                LinhaTabelaHorizontal(campo: "Percentual de Substituição de Água Potável",
                                      valor: dado.percentual)
                LinhaTabelaHorizontal(campo: "Demanda Mensal de Água Pluvial (L)",
                                      valor: "\(String(format: "%.2f", dado.demandaAguaPluvialMensal))")
                LinhaTabelaHorizontal(campo: "Capacidade do Reservatório de Água Pluvial (L)",
                                      valor: "\(String(format: "%.0f", dado.capacidadeReservatorio))")
                LinhaTabelaHorizontal(campo: "Potencial Médio de Atendimento",
                                      valor: "\(String(format: "%.2f", dado.potencialMedioDeAtendimentoDaDemanda * 100))%")
                LinhaTabelaHorizontal(campo: "Número de Meses Parcialmente Atendidos",
                                      valor: "\(String(format: "%.1f", dado.mesesAtendidosParcialmente))")
                LinhaTabelaHorizontal(campo: "Número de Meses Completamente Atendidos",
                                      valor: "\(String(format: "%.1f", dado.mesesAtendidosCompletamente))")
                LinhaTabelaHorizontal(campo: "Número de Meses Não Atendidos",
                                      valor: "\(String(format: "%.1f", dado.mesesNaoAtendidos))")
                
                LinhaTabelaHorizontal(campo: "Investimento Inicial (R$)", valor: "R$ 7000,00")
                VStack {
                    LinhaTabelaHorizontal(campo: "Custo do Reservatório (R$)", valor: "R$ 1.420,63")
                    LinhaTabelaHorizontal(campo: "Outros Custos (R$)", valor: "R$ 400,00")
                    
                    VStack {
                        LinhaTabelaHorizontal(campo: "Custo da Bomba (R$)", valor: "R$ 150,00")
                        LinhaTabelaHorizontal(campo: "Custo das Tubulações e Conexões (R$)", valor: "R$ 100,00")
                        LinhaTabelaHorizontal(campo: "Custo do Clorador (R$)", valor: "R$ 150,00")
                    }.padding(sides: [.left], value: 30)
                    
                }.padding(sides: [.left], value: 30)
                
                LinhaTabelaHorizontal(campo: "Custos Operacionais Anuais (R$)", valor: "R$ 300,00")
                
                LinhaTabelaHorizontal(campo: "Economia Anual de Água (L)", valor: "6528")
                LinhaTabelaHorizontal(campo: "Economia Anual na Conta de Água (R$)", valor: "R$ 669,00")
                LinhaTabelaHorizontal(campo: "Tempo de Retorno do Investimento (anos)", valor: "3")
                Spacer()
            }
            .navigationTitle(Text("Detalhes da Simulação"))
        }
    }
}
