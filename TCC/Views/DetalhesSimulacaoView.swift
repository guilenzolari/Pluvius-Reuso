import SwiftUI
import SwiftUI

struct DetalhesSimulacaoView: View {
    @State var dado: SumarioDadosTotais
    var perfil: String
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    
                    Section {
                        LinhaTabelaHorizontal(campo: "Perfil", valor: perfil)
                    }
                    
                    Section {
                        LinhaTabelaHorizontal(campo: "Percentual de Substituição de Água Potável",
                                              valor: "\(String(format: "%.1f", dado.percentual*100))%")
                        LinhaTabelaHorizontal(campo: "Demanda Mensal de Água Pluvial (L)",
                                              valor: "\(String(format: "%.1f", dado.demandaAguaPluvialMensal))")
                        
                        LinhaTabelaHorizontal(campo: "Capacidade do Reservatório de Água Pluvial (L)",
                                              valor: "\(String(format: "%.0f", dado.capacidadeReservatorio))")
                    }
                    
                    Section {
                        LinhaTabelaHorizontal(campo: "Potencial Médio de Atendimento",
                                              valor: "\(String(format: "%.1f", dado.potencialMedioDeAtendimentoDaDemanda * 100))%")
                        LinhaTabelaHorizontal(campo: "Número de Meses Parcialmente Atendidos",
                                              valor: "\(String(format: "%.1f", dado.mesesAtendidosParcialmente))")
                        LinhaTabelaHorizontal(campo: "Número de Meses Completamente Atendidos",
                                              valor: "\(String(format: "%.1f", dado.mesesAtendidosCompletamente))")
                        LinhaTabelaHorizontal(campo: "Número de Meses Não Atendidos",
                                              valor: "\(String(format: "%.1f", dado.mesesNaoAtendidos))")
                    }
                    
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
                    
                    Section {
                        LinhaTabelaHorizontal(campo: "Economia Anual de Água (L)", valor: "\(String(format: "%.1f", dado.economiaDeAguaAnual))")
                        LinhaTabelaHorizontal(campo: "Economia Anual na Conta de Água (R$)", valor: "\(String(format: "%.1f", dado.economiaFinanceiraAnual))")}
                    
                    Section {
                        LinhaTabelaHorizontal(campo: "Tempo de Retorno do Investimento (anos)", valor: "\(String(format: "%.1f", dado.tempoDeRetorno))")}
                }
            }
            .navigationTitle(Text("Resultados detalhados"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
            }) {
                ContentView(dado: dado)
            })
        }
    }
}

#Preview {
    DetalhesSimulacaoView(dado: SumarioDadosTotais(percentual: 30, capacidadeReservatorio: 30, demandaAguaPluvialMensal: 30, potencialMedioDeAtendimentoDaDemanda: 30, mesesAtendidosParcialmente: 303, mesesAtendidosCompletamente: 30, mesesNaoAtendidos: 30, custoReservatorio: 30, custoDaBomba: 30, custoTubulacao: 30, custoClorador: 30, outrosCustos: 30, investimentoInicial: 030.12, opex: 39230.23, economiaDeAguaAnual: 239203.3, economiaFinanceiraAnual: 239.23, tempoDeRetorno: 39.34), perfil: "Sustentável")
}
