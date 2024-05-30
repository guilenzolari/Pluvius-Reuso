import SwiftUI

struct EscolhaDePerfilView: View {
    @Binding var selectedTab: Int
    @ObservedObject var inputs = InserirDadosViewModel.shared
    var vm = CalculosReservatorios()
    var escolhaPerfilVM = EscolhaDePerfilViewModel()
    @State var indiceBalancedo = 5
    @State var indiceEcoDinheiro = 0
    @State var indiceEcoAgua = 11
    @State var dadosSimulacoes: [SumarioDadosTotais] = []

    var body: some View {
        NavigationView {
            List {
                Section("Percentual de substituição") {
                    CustomSliderView()
                }.listRowBackground(Color.clear)
                Section {
                    NavigationLink {
                        if dadosSimulacoes.indices.contains(1) {
                            DetalhesSimulacaoView(dado: dadosSimulacoes[indiceEcoDinheiro])
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
                                Text("Prioriza o menor custo da implmentação do projeto em detrimento da economia de água potável.")
                                    .font(.footnote)
                                Spacer()
                            }.padding(.bottom)
                            
                            HStack {
                                VStack {
                                    if dadosSimulacoes.indices.contains(0) {
                                        HStack {
                                            Text("Investimento Inicial: R$ \(dadosSimulacoes[indiceEcoDinheiro].investimentoInicial, specifier: "%.2f")")
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Economia Anual: R$ \(dadosSimulacoes[indiceEcoDinheiro].economiaFinanceiraAnual, specifier: "%.2f")")
                                            Spacer()
                                        }
                                        HStack {
                                            if dadosSimulacoes[indiceEcoAgua].tempoDeRetorno > 0 {
                                                Text("Tempo de Retorno do Investimento: \(dadosSimulacoes[indiceEcoDinheiro].tempoDeRetorno, specifier: "%.2f") anos")
                                            } else {
                                                Text("O projeto é financeiramente inviável")}
                                            
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
                        if dadosSimulacoes.indices.contains(indiceBalancedo) {
                            DetalhesSimulacaoView(dado: dadosSimulacoes[indiceBalancedo])
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
                                    if dadosSimulacoes.indices.contains(indiceBalancedo) {
                                        HStack {
                                            Text("Investimento Inicial: R$ \(dadosSimulacoes[indiceBalancedo].investimentoInicial, specifier: "%.2f")")
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Economia Anual: R$ \(dadosSimulacoes[indiceBalancedo].economiaFinanceiraAnual, specifier: "%.2f")")
                                            Spacer()
                                        }
                                        HStack {
                                            if dadosSimulacoes[indiceBalancedo].tempoDeRetorno > 0 {
                                                Text("Tempo de Retorno do Investimento: \(dadosSimulacoes[indiceBalancedo].tempoDeRetorno, specifier: "%.2f") anos")
                                            } else {
                                                Text("O projeto é financeiramente inviável")}
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
                        if dadosSimulacoes.indices.contains(indiceEcoAgua) {
                            DetalhesSimulacaoView(dado: dadosSimulacoes[indiceEcoAgua])
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
                                    if dadosSimulacoes.indices.contains(indiceEcoAgua) {
                                        HStack {
                                            Text("Investimento Inicial: R$ \(dadosSimulacoes[indiceEcoAgua].investimentoInicial, specifier: "%.2f")")
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Economia Anual: R$ \(dadosSimulacoes[indiceEcoAgua].economiaFinanceiraAnual, specifier: "%.2f")")
                                            Spacer()
                                        }
                                        HStack {
                                            if dadosSimulacoes[indiceEcoAgua].tempoDeRetorno > 0 {
                                                Text("Tempo de Retorno do Investimento: \(dadosSimulacoes[indiceEcoAgua].tempoDeRetorno, specifier: "%.2f") anos")
                                            } else {
                                                Text("O projeto é financeiramente inviável")}
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
            atualizarDados()
        }
        .onChange(of: inputs.percentualDeSubstituicao) {
            atualizarDados()
        }
    }

    func atualizarDados() {
        dadosSimulacoes = vm.simulacoesVariandoVolumes(percentual: inputs.percentualDeSubstituicao)
        indiceEcoAgua = escolhaPerfilVM.indicePerfilEcoAgua(dados: dadosSimulacoes)
        indiceBalancedo = escolhaPerfilVM.indicePerfilBalanceado(dados: dadosSimulacoes)
        indiceEcoDinheiro = escolhaPerfilVM.indiceMenorCustoDeImplementacao(dados: dadosSimulacoes)
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
