import SwiftUI

struct EscolhaDePerfilView: View {
    @Binding var selectedTab: Int
    @ObservedObject var inputs = InserirDadosViewModel.shared
    var vm = CalculosReservatorios()
    @State var dadosSimulacoes: [SumarioDadosTotais] = []

    var body: some View {
        NavigationView {
            List {
                Section("Percentual de substituição") {
                    CustomSliderView()
                }
                Section {
                    NavigationLink {
                        if dadosSimulacoes.indices.contains(1) {
                            DetalhesSimulacaoView(dado: dadosSimulacoes[0])
                        } else {
                            Text("Carregando")
                        }
                    } label: {
                        VStack {
                            HStack {
                                Text("Economia de Dinheiro")
                                Image(systemName: "dollarsign.circle")
                                Spacer()
                            }.font(.title2).bold()
       
                            HStack {
                                Text("Prioriza o menor custo em detrimento da economia de água potável.")
                                    .font(.footnote)
                                Spacer()
                            }.padding(.bottom)
                            
                            HStack {
                                VStack {
                                    if dadosSimulacoes.indices.contains(0) {
                                        HStack {
                                            Text("Investimento Inicial: R$ \(dadosSimulacoes[0].investimentoInicial, specifier: "%.2f")")
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Economia Anual: R$ \(dadosSimulacoes[0].economiaFinanceiraAnual, specifier: "%.2f")")
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Tempo de Retorno do Investimento: \(dadosSimulacoes[0].tempoDeRetorno, specifier: "%.2f") anos")
                                            Spacer()
                                        }
                                    } else {
                                        Text("Dados indisponíveis")
                                    }
                                }.font(.caption).bold()
                                Spacer()
                            }
                        }
                    }
                }
                .listRowBackground(Color.green.opacity(0.2))
                Section {
                    NavigationLink {
                        if dadosSimulacoes.indices.contains(5) {
                            DetalhesSimulacaoView(dado: dadosSimulacoes[5])
                        } else {
                            Text("Carregando")
                        }
                    } label: {
                        VStack {
                            HStack {
                                Text("Balanceado")
                                Image(systemName: "equal.circle")
                                Spacer()
                            }.font(.title2).bold()

                            HStack {
                                Text("Equilíbrio entre custo de implementação e economia de água.")
                                    .font(.footnote)
                                Spacer()
                            }.padding(.bottom)
                            
                            HStack {
                                VStack {
                                    if dadosSimulacoes.indices.contains(5) {
                                        HStack {
                                            Text("Investimento Inicial: R$ \(dadosSimulacoes[5].investimentoInicial, specifier: "%.2f")")
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Economia Anual: R$ \(dadosSimulacoes[5].economiaFinanceiraAnual, specifier: "%.2f")")
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Tempo de Retorno do Investimento: \(dadosSimulacoes[5].tempoDeRetorno, specifier: "%.2f") anos")
                                            Spacer()
                                        }
                                    } else {
                                        Text("Dados indisponíveis")
                                    }
                                }.font(.caption).bold()
                                Spacer()
                            }
                        }
                    }
                }
                .listRowBackground(Color.yellow.opacity(0.2))
                Section {
                    NavigationLink {
                        if dadosSimulacoes.indices.contains(11) {
                            DetalhesSimulacaoView(dado: dadosSimulacoes[11])
                        } else {
                            Text("Carregando")
                        }
                    } label: {
                        VStack {
                            HStack {
                                Text("Economia de Água")
                                Image(systemName: "drop")
                                Spacer()
                            }.font(.title2).bold()
       
                            HStack {
                                Text("Prioriza a economia de água potável, mesmo que implique em maior custo de implementação.")
                                    .font(.footnote)
                                Spacer()
                            }.padding(.bottom)
                            
                            HStack {
                                VStack {
                                    if dadosSimulacoes.indices.contains(11) {
                                        HStack {
                                            Text("Investimento Inicial: R$ \(dadosSimulacoes[11].investimentoInicial, specifier: "%.2f")")
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Economia Anual: R$ \(dadosSimulacoes[11].economiaFinanceiraAnual, specifier: "%.2f")")
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Tempo de Retorno do Investimento: \(dadosSimulacoes[11].tempoDeRetorno, specifier: "%.2f") anos")
                                            Spacer()
                                        }
                                    } else {
                                        Text("Dados indisponíveis")
                                    }
                                }.font(.caption).bold()
                                Spacer()
                            }
                        }
                    }
                }
                .listRowBackground(Color.blue.opacity(0.2))

            }
        }
        .navigationTitle(Text("Escolha o seu tipo de perfil"))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            dadosSimulacoes = vm.simulacoesVariandoVolumes(percentual: inputs.percentualDeSubstituicao)
        }
        .onChange(of: inputs.percentualDeSubstituicao) { newValue in
            dadosSimulacoes = vm.simulacoesVariandoVolumes(percentual: newValue)
        }
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
