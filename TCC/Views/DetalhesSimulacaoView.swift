//
//  DetalhesSimulaçãoVi.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 27/05/24.
//

import SwiftUI

struct DetalhesSimulacaoView: View {
    var body: some View {
        VStack {
            LinhaTabelaHorizontal(campo: "Percentual de Substituição", valor: "30%")
            LinhaTabelaHorizontal(campo: "Demanda água pluvial Mensal (L)", valor: "4270,5")
            LinhaTabelaHorizontal(campo: "Capacidade do Reservatório (L)", valor: "600")
            LinhaTabelaHorizontal(campo: "Potencial de atendimento Médio %", valor: "13,4%")
            LinhaTabelaHorizontal(campo: "Nº meses atendidos parcialmente", valor: "11")
            LinhaTabelaHorizontal(campo: "Nº meses atendidos completamente", valor: "0")
            LinhaTabelaHorizontal(campo: "Nº meses não atendidos", valor: "1")
            LinhaTabelaHorizontal(campo: "Custos", valor: "")
            VStack {
                LinhaTabelaHorizontal(campo: "Custo Reservatório", valor: "R$ 1.420,63")
                LinhaTabelaHorizontal(campo: "Outros Custos", valor: "400")
                LinhaTabelaHorizontal(campo: "Custos operacionais", valor: "300")

            }.padding(sides: [.left], value: 20)
            
            LinhaTabelaHorizontal(campo: "Economia de Água (L/ano)", valor: "6528")
            LinhaTabelaHorizontal(campo: "Economia de Água (R$/ano)", valor: "R$ 669")
            LinhaTabelaHorizontal(campo: "Tempo de Retorno no Investimento (anos)", valor: "3")
            Spacer()
        }
        .navigationTitle(Text("Detalhes da Simulação"))
    }
}

#Preview {
    DetalhesSimulacaoView()
}
