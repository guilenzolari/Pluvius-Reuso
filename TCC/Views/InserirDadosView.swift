//
//  ContentView.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 23/04/24.
//

import SwiftUI

struct InserirDadosView: View {
    
    @EnvironmentObject var contas: InserirDadosViewController
    @State var isTextFieldFilled = false
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationView{
            VStack {
                Form{
                    Section(header: Text("Coleta"), footer: Text("Área da superfície que será utilizada para coletar a água da chuva como telhados, lajes, calhas, etc.")){
                        TextField("Área de Captação (m³)", text: $contas.area)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(footer: Text("Valor pode ser encontrado na conta de água sua residência. Pode variar de acordo com a faixa de consumo e localização da residência")){
                        TextField("Preço da água (R$/m³)", text: $contas.tarifaDaAgua)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(header: Text("Demanda"), footer: Text("Preencha apenas um dos dois campos acima. Preencher o campo de ”Consumo mensal de água” retornará resultados mais precisos.")){
                        TextField("Consumo médio mensal de água (m³)", text: $contas.consumoMediaDaResidencia)
                            .keyboardType(.numberPad)
                            .disabled(!contas.quantidadeMoradoresDaResidencia.isEmpty)
                        
                        TextField("Quantidade de moradores", text: $contas.quantidadeMoradoresDaResidencia)
                            .keyboardType(.numberPad)
                            .disabled(!contas.consumoMediaDaResidencia.isEmpty)
                    }
                    
                    Section{
                        Button(action: {
                            selectedTab = 1
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Concluir")
                                Spacer()
                            }
                        }).disabled(!contas.isTextFieldFilled())
                    }
                }
            }
            .navigationTitle(Text("Insira os dados da sua residência"))
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

