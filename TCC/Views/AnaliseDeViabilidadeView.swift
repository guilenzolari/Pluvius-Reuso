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
    let percentualDeSubstituicao = [0.25, 0.3, 0.35, 0.4]
    
    var calculosReservatorios = CalculosReservatorios()

    @ObservedObject var inputs = InserirDadosViewModel.shared
    @State var dadosSimulacao25: [SumarioDados] = [
        SumarioDados(
            percentual: "0",
            capacidadeReservatorio: 0,
            demandaAguaPluvialMensal: 0,
            potencialMedioDeAtendimentoDaDemanda: 0,
            mesesAtendidosParcialmente: 0,
            mesesAtendidosCompletamente: 0,
            mesesNaoAtendidos: 0
        )]
    @State var dadosSimulacao30: [SumarioDados] = [
        SumarioDados(
            percentual: "0",
            capacidadeReservatorio: 0,
            demandaAguaPluvialMensal: 0,
            potencialMedioDeAtendimentoDaDemanda: 0,
            mesesAtendidosParcialmente: 0,
            mesesAtendidosCompletamente: 0,
            mesesNaoAtendidos: 0
        )]
    @State var dadosSimulacao35: [SumarioDados] = [
        SumarioDados(
            percentual: "0",
            capacidadeReservatorio: 0,
            demandaAguaPluvialMensal: 0,
            potencialMedioDeAtendimentoDaDemanda: 0,
            mesesAtendidosParcialmente: 0,
            mesesAtendidosCompletamente: 0,
            mesesNaoAtendidos: 0
        )]
    @State var dadosSimulacao40: [SumarioDados] = [
        SumarioDados(
            percentual: "0",
            capacidadeReservatorio: 0,
            demandaAguaPluvialMensal: 0,
            potencialMedioDeAtendimentoDaDemanda: 0,
            mesesAtendidosParcialmente: 0,
            mesesAtendidosCompletamente: 0,
            mesesNaoAtendidos: 0
        )]

    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                VStack {
                    Text("Simulação 1: Substituição de \(dadosSimulacao25.first?.percentual ?? "0") de água potável por água de reúso").padding()
                        .font(.title2)
                    TableView(dadosSimulacao: $dadosSimulacao25)
                    
                    Text("Simulação 2: Substituição de \(dadosSimulacao30.first?.percentual ?? "0") de água potável por água de reúso").padding()
                        .font(.title2)
                    TableView(dadosSimulacao: $dadosSimulacao30)
                    
                    Text("Simulação 3: Substituição de \(dadosSimulacao35.first?.percentual ?? "0") de água potável por água de reúso").padding()
                        .font(.title2)
                    TableView(dadosSimulacao: $dadosSimulacao35)
                    
                    Text("Simulação 4: Substituição de \(dadosSimulacao40.first?.percentual ?? "0") de água potável por água de reúso").padding()
                        .font(.title2)
                    TableView(dadosSimulacao: $dadosSimulacao40)
                }
            }
            .navigationTitle(Text("Analise de Viabilidade"))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                dadosSimulacao25 = calculosReservatorios.simulacoesVariandoVolumes(percentual: 0.25)
                dadosSimulacao30 = calculosReservatorios.simulacoesVariandoVolumes(percentual: 0.3)
                dadosSimulacao35 = calculosReservatorios.simulacoesVariandoVolumes(percentual: 0.35)
                dadosSimulacao40 = calculosReservatorios.simulacoesVariandoVolumes(percentual: 0.4)

            }
        }
    }
}
