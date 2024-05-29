//
//  EscolhaDePerfilView.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 28/05/24.
//

import SwiftUI

struct EscolhaDePerfilView: View {
    @Binding var selectedTab: Int
    var body: some View {
        NavigationView {
            List {
                
                Section("Percentual de substituição") {
                    CustomSliderView()
                }
                Section {
                    NavigationLink {
                        AnaliseDeViabilidadeView()
                    } label: {
                        VStack{
                            HStack{
                                Text("Economia de Dinheiro")
                                Image(systemName: "dollarsign.circle")
                                Spacer()
                            }.font(.title2)
                                .bold()
       
                            HStack {
                                Text("Prioriza o menor custo em detrimento da economia de água potável.")
                                    .font(.footnote)
                                    .foregroundStyle(Color.gray)
                                Spacer()
                            }.padding(.bottom)
                            
                            HStack{
                                VStack{
                                    HStack {
                                        Text("Investimento Inicial: R$ 7000,00")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Economia Anual: R$ 680,00")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Tempo de Retorno do Investimento: 3,5 anos")
                                        Spacer()
                                    }
                                }.font(.footnote)
                                Spacer()
                            }
                        }
                    }
                }
                Section {
                    NavigationLink {
                        AnaliseDeViabilidadeView()
                    } label: {
                        VStack{
                            HStack{
                                Text("Balanceado")
                                Image(systemName: "equal.circle")
                                Spacer()
                            }.font(.title2)
                                .bold()

       
                            HStack {
                                Text("Equilíbrio entre custo de implementação e economia de água.")
                                    .font(.footnote)
                                .foregroundStyle(Color.gray)
                                Spacer()
                            }.padding(.bottom)
                            
                            HStack{
                                VStack{
                                    HStack {
                                        Text("Investimento Inicial: R$ 7000,00")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Economia Anual: R$ 680,00")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Tempo de Retorno do Investimento: 3,5 anos")
                                        Spacer()
                                    }
                                }.font(.footnote)
                                    

                                Spacer()
                                
                            }
                        }
                        
                        
                    }

                }
                Section {
                    NavigationLink {
                        AnaliseDeViabilidadeView()
                    } label: {
                        VStack{
                            HStack{
                                Text("Economia de Água")
                                Image(systemName: "drop")
                                Spacer()
                            }.font(.title2)
                                .bold()
       
                            HStack {
                                Text("Prioriza a economia de água potável, mesmo que implique em maior custo de implementação.")
                                    .font(.footnote)
                                .foregroundStyle(Color.gray)
                                Spacer()
                            }.padding(.bottom)
                            
                            HStack{
                                VStack{
                                    HStack {
                                        Text("Investimento Inicial: R$ 7000,00")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Economia Anual: R$ 680,00")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Tempo de Retorno do Investimento: 3,5 anos")
                                        Spacer()
                                    }
                                }.font(.footnote)
                                    

                                Spacer()
                                
                            }
                        }
                        
                        
                    }

                }
            }
        } .navigationTitle(Text("Escolha o seu tipo de perfil"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Preview: View {
    @State var selectedTab = 1
    let viewModel = InserirDadosViewModel.shared
    var body: some View {
        EscolhaDePerfilView(selectedTab: $selectedTab)
    }
}

#Preview {
    Preview()
}
