import SwiftUI
import Charts

struct AnaliseDeViabilidadeView: View {
   // @Binding var selectedTab: Int
    let percentualSubstituido = 30
    let demandaAguaPluvialMensal = 4270.5
    let capacidadeReservatorio = 600
    let potencialAtendimentoMedio = 13.4
    let nMesesAtendidos = 12
    let custoReservatorio = 1500
    
    var calculosReservatorios = CalculosReservatorios()

    @ObservedObject var inputs = InserirDadosViewModel.shared
    @State var dadosSimulacoes: [[SumarioDados]] = [[SumarioDados(percentual: "3.0", capacidadeReservatorio: 2, demandaAguaPluvialMensal: 5, potencialMedioDeAtendimentoDaDemanda: 4, mesesAtendidosParcialmente: 2, mesesAtendidosCompletamente: 2, mesesNaoAtendidos: 5)]]

    var body: some View {
        NavigationView {
            ScrollView {
                
                LazyVStack {
                    ForEach($dadosSimulacoes, id: \.self) { dado in
                        TableView(dadosSimulacao: dado)
                        Divider()
                    }
                }
            }
            .navigationTitle(Text("Análise de Viabilidade"))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                dadosSimulacoes = [calculosReservatorios.simulacoesVariandoVolumes(percentual: 0.25),
                                   calculosReservatorios.simulacoesVariandoVolumes(percentual: 0.3),
                                   calculosReservatorios.simulacoesVariandoVolumes(percentual: 0.35),
                                   calculosReservatorios.simulacoesVariandoVolumes(percentual: 0.4)]

        }
        }
    }
}
