//
//  BotaoEscolhaPerfil.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 30/05/24.
//

import SwiftUI

struct BotaoEscolhaPerfil: View {
    var indice: Int
    var dadosSimulacoes: [SumarioDadosTotais]
    var image: String
    var title: String
    var text: String
    var color: Color
    
        //mock
    var economia: String
    var tempoRetorno: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: image)
                    .foregroundStyle(color).opacity(0.5)
                Text(title)
                Spacer()
            }.font(.title).bold()
            
            HStack {
                Text(text)
                    .font(.footnote)
                    .foregroundStyle(Color.gray)
                Spacer()
            }.padding(.vertical, 4)
            
            
            HStack {
                VStack {
                    if dadosSimulacoes.indices.contains(indice) {
                            HStack {
                                VStack {
                                    Text("INVESTIMENTO INICIAL")
                                    Text("R$ \(dadosSimulacoes[indice].investimentoInicial, specifier: "%.2f")")
                                }
                            Spacer()
                            VStack{
                                Text("ECONOMIA")
                                Text(economia)
                            }
                            Spacer()
                            VStack{
                                Text("RETORNO")
                                if dadosSimulacoes[indice].tempoDeRetorno > 0 {
                                    Text(tempoRetorno)
                                } else {
                                    Text("O projeto é financeiramente inviável")}
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    } else {
                        Text("Dados indisponíveis")
                    }
                }.font(.caption)
                Spacer()
            }
            Divider()
            NavigationLink{
                if dadosSimulacoes.indices.contains(indice) {
                    DetalhesSimulacaoView(dado: dadosSimulacoes[indice],
                                          economia: economia,
                                          tempoRetorno: tempoRetorno)
                } else {
                    Text("Carregando")}
            }label: {
                HStack {
                    Text("Ver mais sobre o plano")
                        .padding(.vertical, 4)
                    Spacer()
                }
            }
            
        }
    }
}
