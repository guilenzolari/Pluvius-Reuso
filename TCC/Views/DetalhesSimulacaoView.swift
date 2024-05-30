import SwiftUI

struct DetalhesSimulacaoView: View {
    @State var dado: SumarioDadosTotais
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    Spacer()
                        .frame(height: getWidth()/18)
                    
                    LinhaTabelaHorizontal(campo: "Percentual de Substituição de Água Potável",
                                          valor: "\(String(format: "%.1f", dado.percentual*100))%")
                    LinhaTabelaHorizontal(campo: "Demanda Mensal de Água Pluvial (L)",
                                          valor: "\(String(format: "%.1f", dado.demandaAguaPluvialMensal))")
                    LinhaTabelaHorizontal(campo: "Capacidade do Reservatório de Água Pluvial (L)",
                                          valor: "\(String(format: "%.1f", dado.capacidadeReservatorio))")
                    LinhaTabelaHorizontal(campo: "Potencial Médio de Atendimento",
                                          valor: "\(String(format: "%.1f", dado.potencialMedioDeAtendimentoDaDemanda * 100))%")
                    LinhaTabelaHorizontal(campo: "Número de Meses Parcialmente Atendidos",
                                          valor: "\(String(format: "%.1f", dado.mesesAtendidosParcialmente))")
                    LinhaTabelaHorizontal(campo: "Número de Meses Completamente Atendidos",
                                          valor: "\(String(format: "%.1f", dado.mesesAtendidosCompletamente))")
                    LinhaTabelaHorizontal(campo: "Número de Meses Não Atendidos",
                                          valor: "\(String(format: "%.1f", dado.mesesNaoAtendidos))")
                    
                    LinhaTabelaHorizontal(campo: "Investimento Inicial (R$)", valor: "\(String(format: "%.1f", dado.investimentoInicial))")
                    
                    VStack {
                        LinhaTabelaHorizontal(campo: "Custo do Reservatório (R$)", valor: "\(String(format: "%.1f", dado.custoReservatorio))")
                        LinhaTabelaHorizontal(campo: "Outros Custos (R$)", valor: "\(String(format: "%.1f", dado.outrosCustos))")
                        
                        VStack {
                            LinhaTabelaHorizontal(campo: "Custo da Bomba (R$)", valor: "\(String(format: "%.1f", dado.custoDaBomba))")
                            LinhaTabelaHorizontal(campo: "Custo das Tubulações e Conexões (R$)", valor: "\(String(format: "%.1f", dado.custoTubulacao))")
                            LinhaTabelaHorizontal(campo: "Custo do Clorador (R$)", valor: "\(String(format: "%.1f", dado.custoClorador))")
                        }.padding(sides: [.left], value: 32)
                        
                    }.padding(sides: [.left], value: 32)
                    
                    LinhaTabelaHorizontal(campo: "Custos Operacionais Anuais (R$)", valor: "\(String(format: "%.1f", dado.opex))")
                    
                    LinhaTabelaHorizontal(campo: "Economia Anual de Água (L)", valor: "\(String(format: "%.1f", dado.economiaDeAguaAnual))")
                    LinhaTabelaHorizontal(campo: "Economia Anual na Conta de Água (R$)", valor: "\(String(format: "%.1f", dado.economiaFinanceiraAnual))")
                    LinhaTabelaHorizontal(campo: "Tempo de Retorno do Investimento (anos)", valor: "\(String(format: "%.1f", dado.tempoDeRetorno))")
                    Spacer()
                }
            }
            .navigationTitle(Text("Análise de Viabilidade"))
            .navigationBarTitleDisplayMode(.inline)
  
        }
    }
}
