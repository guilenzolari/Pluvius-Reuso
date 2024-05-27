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
            ScrollView {
                LazyVStack {
                    
                    Text("Simulação 1: Substituição de 25% de água potável por água de reúso com demanda de Água Pluvial de \(String(format: "%.2f", dadosSimulacao25[0].demandaAguaPluvialMensal))L")
                        .padding()
                        .font(.title2)
                    TableView(dadosSimulacao: $dadosSimulacao25)
                    Divider()
                    
                    Text("Simulação 2: Substituição de 30% de água potável por água de reúso com demanda de Água Pluvial de \(String(format: "%.2f", dadosSimulacao30[0].demandaAguaPluvialMensal))L")
                        .padding()
                        .font(.title2)
                    TableView(dadosSimulacao: $dadosSimulacao30)
                    Divider()

                    
                    Text("Simulação 3: Substituição de 35% de água potável por água de reúso com demanda de Água Pluvial de \(String(format: "%.2f", dadosSimulacao35[0].demandaAguaPluvialMensal))L")
                        .padding()
                        .font(.title2)
                    TableView(dadosSimulacao: $dadosSimulacao35)
                    Divider()

                    
                    Text("Simulação 4: Substituição de 40% de água potável por água de reúso com demanda de Água Pluvial de \(String(format: "%.2f", dadosSimulacao40[0].demandaAguaPluvialMensal))L")
                        .padding()
                        .font(.title2)
                    TableView(dadosSimulacao: $dadosSimulacao40)
                    Divider()
                }
            }
            .navigationTitle(Text("Análise de Viabilidade"))
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
