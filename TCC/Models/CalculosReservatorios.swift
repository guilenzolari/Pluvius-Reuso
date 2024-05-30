import Foundation
import SwiftUI

class CalculosReservatorios: ObservableObject {
    
    let consumoMedioPessoa: Double = 156 // Litros/dia*pessoa
    let coeficienteAproveitamento: Double = 0.8
    let precipitacaoMensal: [Double] = [178.1, 258.8, 81.3, 12.2, 23.4, 27.1, 0, 15.5, 6.6, 121.4, 83.8, 168.1, 312.9, 168.4, 130.8, 40.1, 39.4, 15.7, 8.9, 28.2, 89.7, 120.4, 142.5, 324.1]
    let volumesTanques: [Double] = [600, 1000, 1600, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000]
    let custoBomba: Double = 150
    let custoTubulacao: Double = 100
    let custoClorador: Double = 150
    let capex = CalculoCAPEX()
    let opex: Double = 300
    
    @ObservedObject var inputs = InserirDadosViewModel.shared
    
    func demandaAguaPluvialMensal(percentualSubstituicao: Double) -> Double {
        if inputs.quantidadeMoradoresDaResidencia != 0 {
            return inputs.quantidadeMoradoresDaResidencia * consumoMedioPessoa * percentualSubstituicao * (365/12)
        } else {
            return inputs.consumoMediaDaResidencia * percentualSubstituicao
        }
    }
    
    func volumeCaptadoNosMeses(precipitacaoDoMes: Double) -> Double {
        return precipitacaoDoMes * coeficienteAproveitamento * inputs.area
    }
    
    func volumeDisponivelReservatorioPosCaptacaoPreConsumo(volumeReservatorio: Double, volumeReservatorioPosConsumo: Double, volumeCaptado: Double) -> Double {
        return min(volumeReservatorio, volumeReservatorioPosConsumo + volumeCaptado)
    }
    
    func volumeReservatorioPosConsumo(volumeDisponivelReservatorioPosCaptacaoPreConsumo: Double, demandaAguaPluvialMensal: Double) -> Double {
        return max(0, volumeDisponivelReservatorioPosCaptacaoPreConsumo - demandaAguaPluvialMensal)
    }
    
    func volumeDeAguaConsumido(volumeDisponivelReservatorioPosCaptacaoPreConsumo: Double, demandaAguaPluvialMensal: Double) -> Double {
        return min(volumeDisponivelReservatorioPosCaptacaoPreConsumo, demandaAguaPluvialMensal)
    }
    
    func potencialDeAtendimentoDaDemanda(volumeDeAguaConsumido: Double, demandaAguaPluvialMensal: Double) -> Double {
        return volumeDeAguaConsumido / demandaAguaPluvialMensal
    }
    
    func calculosDoMes(index: Int, volumeReservatorio: Double, percentual: Double) -> DadosConsumoMes {
        let volumeDeAguapluvialCaptada = volumeCaptadoNosMeses(precipitacaoDoMes: precipitacaoMensal[index])
        
        let volumeDisponivelReservatorioPosCaptacaoPreConsumo1: Double
        if index == 0 {
            volumeDisponivelReservatorioPosCaptacaoPreConsumo1 = volumeDisponivelReservatorioPosCaptacaoPreConsumo(
                volumeReservatorio: volumeReservatorio,
                volumeReservatorioPosConsumo: 0,
                volumeCaptado: volumeDeAguapluvialCaptada
            )
        } else {
            volumeDisponivelReservatorioPosCaptacaoPreConsumo1 = volumeDisponivelReservatorioPosCaptacaoPreConsumo(
                volumeReservatorio: volumeReservatorio,
                volumeReservatorioPosConsumo: calculosDoMes(index: index - 1, volumeReservatorio: volumeReservatorio, percentual: percentual).volumeReservatorioPosConsumo,
                volumeCaptado: volumeDeAguapluvialCaptada
            )
        }
        
        let demandaDeAgua = demandaAguaPluvialMensal(percentualSubstituicao: percentual)
        let volumeReservatorioPosConsumo = volumeReservatorioPosConsumo(
            volumeDisponivelReservatorioPosCaptacaoPreConsumo: volumeDisponivelReservatorioPosCaptacaoPreConsumo1,
            demandaAguaPluvialMensal: demandaDeAgua
        )
        let volumeDeAguaConsumido = volumeDeAguaConsumido(
            volumeDisponivelReservatorioPosCaptacaoPreConsumo: volumeDisponivelReservatorioPosCaptacaoPreConsumo1,
            demandaAguaPluvialMensal: demandaDeAgua
        )
        let potencialDeAtendimentoDaDemanda = potencialDeAtendimentoDaDemanda(
            volumeDeAguaConsumido: volumeDeAguaConsumido,
            demandaAguaPluvialMensal: demandaDeAgua
        )
        
        return DadosConsumoMes(
            volumeDeAguapluvialCaptada: volumeDeAguapluvialCaptada,
            volumeDisponivelReservatorioPosCaptacaoPreConsumo: volumeDisponivelReservatorioPosCaptacaoPreConsumo1,
            demandaDeAgua: demandaDeAgua,
            volumeReservatorioPosConsumo: volumeReservatorioPosConsumo,
            volumeConsumido: volumeDeAguaConsumido,
            potencialDeAtendimentoDaDemanda: potencialDeAtendimentoDaDemanda
        )
    }
    
    func calculosDeTodosMeses(percentual: Double, volumeReservatorio: Double) -> DadosMensais {
        var dadosMeses: [DadosConsumoMes] = []
        
        for index in 0..<precipitacaoMensal.count {
            let dadoMes = calculosDoMes(index: index, volumeReservatorio: volumeReservatorio, percentual: percentual)
            dadosMeses.append(dadoMes)
        }
        
        return DadosMensais(
            percentual: percentual,
            capacidadeReservatorio: volumeReservatorio,
            demandaAguaPluvialMensal: dadosMeses[0].demandaDeAgua,
            potencialMedioDeAtendimentoDaDemanda: potencialMedioDeAtendimentoDaDemanda(dadosMeses: dadosMeses),
            mesesAtendidosParcialmente: mesesAtendidosParcialmente(dadosMeses: dadosMeses),
            mesesAtendidosCompletamente: mesesAtendidosCompletamente(dadosMeses: dadosMeses),
            mesesNaoAtendidos: mesesNaoAtendidos(dadosMeses: dadosMeses)
        )
    }
    
    func simulacoesVariandoVolumes(percentual: Double) -> [SumarioDadosTotais] {
        var dadosTotais: [SumarioDadosTotais] = []
        
        for volume in volumesTanques {
            let dadosMensais = calculosDeTodosMeses(percentual: percentual, volumeReservatorio: volume)
            let calculosDeUmVolume = SumarioDadosTotais(
                percentual: percentual,
                capacidadeReservatorio: volume,
                demandaAguaPluvialMensal: dadosMensais.demandaAguaPluvialMensal,
                potencialMedioDeAtendimentoDaDemanda: dadosMensais.potencialMedioDeAtendimentoDaDemanda,
                mesesAtendidosParcialmente: dadosMensais.mesesAtendidosParcialmente,
                mesesAtendidosCompletamente: dadosMensais.mesesAtendidosCompletamente,
                mesesNaoAtendidos: dadosMensais.mesesNaoAtendidos,
                custoReservatorio: capex.custoTotalReservatorios(volume: volume),
                custoDaBomba: custoBomba,
                custoTubulacao: custoTubulacao,
                custoClorador: custoClorador,
                outrosCustos: outrosCustos(),
                investimentoInicial: investimentoInicial(volume: volume),
                opex: opex,
                economiaDeAguaAnual: economiaDeAguaAnual(
                    potencialMedioDeAtendimentoDaDemanda: dadosMensais.potencialMedioDeAtendimentoDaDemanda,
                    demandaMensal: dadosMensais.demandaAguaPluvialMensal
                ),
                economiaFinanceiraAnual: economiaFinanceiraAnual(
                    potencialMedioDeAtendimentoDaDemanda: dadosMensais.potencialMedioDeAtendimentoDaDemanda,
                    demandaMensal: dadosMensais.demandaAguaPluvialMensal
                ),
                tempoDeRetorno: tempoDeRetorno(
                    volume: volume,
                    potencialMedioDeAtendimentoDaDemanda: dadosMensais.potencialMedioDeAtendimentoDaDemanda,
                    demandaMensal: dadosMensais.demandaAguaPluvialMensal
                )
            )
            
            dadosTotais.append(calculosDeUmVolume)
        }
        return dadosTotais
    }
    
    func potencialMedioDeAtendimentoDaDemanda(dadosMeses: [DadosConsumoMes]) -> Double {
        let valores = dadosMeses.map { $0.potencialDeAtendimentoDaDemanda }
        return calcularMedia(valores)
    }
    
    func calcularMedia(_ numeros: [Double]) -> Double {
        let soma = numeros.reduce(0, +)
        return soma / Double(numeros.count)
    }
    
    func mesesAtendidosParcialmente(dadosMeses: [DadosConsumoMes]) -> Double {
        let count = dadosMeses.filter { $0.potencialDeAtendimentoDaDemanda > 0.01 && $0.potencialDeAtendimentoDaDemanda < 1 }.count
        return Double(count) / Double(precipitacaoMensal.count / 12)
    }
    
    func mesesAtendidosCompletamente(dadosMeses: [DadosConsumoMes]) -> Double {
        let count = dadosMeses.filter { $0.potencialDeAtendimentoDaDemanda == 1 }.count
        return Double(count) / Double(precipitacaoMensal.count / 12)
    }
    
    func mesesNaoAtendidos(dadosMeses: [DadosConsumoMes]) -> Double {
        let count = dadosMeses.filter { $0.potencialDeAtendimentoDaDemanda < 0.05 }.count
        return Double(count) / Double(precipitacaoMensal.count / 12)
    }
    
    func outrosCustos() -> Double {
        return custoBomba + custoClorador + custoTubulacao
    }
    
    func investimentoInicial(volume: Double) -> Double {
        return outrosCustos() + capex.custoTotalReservatorios(volume: volume)
    }
    
    func economiaDeAguaAnual(potencialMedioDeAtendimentoDaDemanda: Double, demandaMensal: Double) -> Double {
        return potencialMedioDeAtendimentoDaDemanda * demandaMensal
    }
    
    func economiaFinanceiraAnual(potencialMedioDeAtendimentoDaDemanda: Double, demandaMensal: Double) -> Double {
        let economiaDeAguaAnual = economiaDeAguaAnual(potencialMedioDeAtendimentoDaDemanda: potencialMedioDeAtendimentoDaDemanda, demandaMensal: demandaMensal) / 1000 // m3
        return economiaDeAguaAnual * inputs.tarifaDaAgua
    }
    
    func tempoDeRetorno(volume: Double, potencialMedioDeAtendimentoDaDemanda: Double, demandaMensal: Double) -> Double {
        let economiaEfetivaAnual = economiaFinanceiraAnual(potencialMedioDeAtendimentoDaDemanda: potencialMedioDeAtendimentoDaDemanda, demandaMensal: demandaMensal) - opex
        return investimentoInicial(volume: volume) / economiaEfetivaAnual
    }
}

struct DadosConsumoMes {
    var volumeDeAguapluvialCaptada: Double
    var volumeDisponivelReservatorioPosCaptacaoPreConsumo: Double
    var demandaDeAgua: Double
    var volumeReservatorioPosConsumo: Double
    var volumeConsumido: Double
    var potencialDeAtendimentoDaDemanda: Double
}

struct DadosMensais: Identifiable, Hashable {
    var id = UUID()
    var percentual: Double
    var capacidadeReservatorio: Double
    var demandaAguaPluvialMensal: Double
    var potencialMedioDeAtendimentoDaDemanda: Double
    var mesesAtendidosParcialmente: Double
    var mesesAtendidosCompletamente: Double
    var mesesNaoAtendidos: Double
}

struct SumarioDadosTotais: Identifiable, Hashable {
    var id = UUID()
    var percentual: Double
    var capacidadeReservatorio: Double
    var demandaAguaPluvialMensal: Double
    var potencialMedioDeAtendimentoDaDemanda: Double
    var mesesAtendidosParcialmente: Double
    var mesesAtendidosCompletamente: Double
    var mesesNaoAtendidos: Double
    var custoReservatorio: Double
    var custoDaBomba: Double
    var custoTubulacao: Double
    var custoClorador: Double
    var outrosCustos: Double
    var investimentoInicial: Double
    var opex: Double
    var economiaDeAguaAnual: Double
    var economiaFinanceiraAnual: Double
    var tempoDeRetorno: Double
}
