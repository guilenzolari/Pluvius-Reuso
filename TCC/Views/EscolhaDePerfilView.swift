import SwiftUI

struct EscolhaDePerfilView: View {
    @Binding var selectedTab: Int
    @ObservedObject var inputs = InserirDadosViewModel.shared
    var vm = MemorialDeCalculo()
    var escolhaPerfilVM = EscolhaDePerfilViewModel()
    @State var indiceBalancedo = 6
    @State var indiceEcoDinheiro = 0
    @State var indiceEcoAgua = 11
    @State var dadosSimulacoes: [SumarioDadosTotais] = []

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Substituição"), footer: Text("Porcentagem de água potável substituída por água da chuva.")) {
                    CustomSliderView().padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                }
               
                Section{
                    BotaoEscolhaPerfil(indice: indiceEcoAgua,
                                       dadosSimulacoes: dadosSimulacoes,
                                       image: "drop.circle.fill",
                                       title: "Sustentável",
                                       text: "Prioriza a economia de água potável, mesmo que implique em maior custo de implementação.", 
                                       color: .blue, 
                                       perfil: "Sustentável")}
                Section {
                    BotaoEscolhaPerfil(indice: indiceBalancedo,
                                       dadosSimulacoes: dadosSimulacoes,
                                       image: "equal.circle.fill",
                                       title: "Balanceado",
                                       text: "Equilíbrio entre custo de implementação e economia de água.", 
                                       color: .yellow, perfil: "Balanceado")}
                
                Section {
                    BotaoEscolhaPerfil(indice: indiceEcoDinheiro,
                                       dadosSimulacoes: dadosSimulacoes,
                                       image: "dollarsign.circle.fill",
                                       title: "Econômico",
                                       text: "Prioriza o menor custo da implmentação do projeto em detrimento da economia de água potável.", 
                                       color: .green, 
                                       perfil: "Econômico")
                }
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
