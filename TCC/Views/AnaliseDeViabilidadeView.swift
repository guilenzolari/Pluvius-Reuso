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
    @State var dadosSimulacao: [SumarioDados] = [
        SumarioDados(
            percentual: "0",
            capacidadeReservatorio: 0,
            demandaAguaPluvialMensal: 0,
            potencialMedioDeAtendimentoDaDemanda: 0,
            mesesAtendidosParcialmente: 0,
            mesesAtendidosCompletamente: 0,
            mesesNaoAtendidos: 0
        )
    ]

    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                VStack {
                    Text("Simulação 1: Substituição de \(dadosSimulacao.first?.percentual ?? "0") de água potável por água de reúso").padding()
                        .font(.title2)
                    
                    TableView(dadosSimulacao: $dadosSimulacao)

                }

            }
            .navigationTitle(Text("Analise de Viabilidade"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
