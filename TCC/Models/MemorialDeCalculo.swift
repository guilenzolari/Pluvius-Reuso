import Foundation
import SwiftUI

class MemorialDeCalculo: ObservableObject {
    
    let consumoMedioPessoa: Double = 156 // Litros/dia*pessoa
    let coeficienteAproveitamento: Double = 0.8
    let precipitacaoMensal: [Double] = [178.1, 258.8, 81.3, 12.2, 23.4, 27.1, 0, 15.5, 6.6, 121.4, 83.8, 168.1, 312.9, 168.4, 130.8, 40.1, 39.4, 15.7, 8.9, 28.2, 89.7, 120.4, 142.5, 324.1]
    let volumesTanques: [Double] = [600, 1000, 1600, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000] //L
    let custoBomba: Double = 150
    let custoTubulacao: Double = 100
    let custoClorador: Double = 150
    let capex = CalculoCustoReservatorio()
    let opex: Double = 300
    
    @ObservedObject var inputs = InserirDadosViewModel.shared
    
    func demandaAguaPluvialMensal(percentualSubstituicao: Double) -> Double {
        if inputs.consumoMedioDaResidencia == 0 {
            let demanda =  inputs.quantidadeMoradoresDaResidencia * consumoMedioPessoa * percentualSubstituicao * (365 / 12)
            return demanda
        } else {
            let demanda = inputs.consumoMedioDaResidencia * percentualSubstituicao * 1000
            return demanda
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
    
    //L
    func economiaDeAguaAnual(potencialMedioDeAtendimentoDaDemanda: Double, demandaMensal: Double) -> Double {
        return potencialMedioDeAtendimentoDaDemanda * demandaMensal * 12
    }
    
    func economiaFinanceiraAnual(potencialMedioDeAtendimentoDaDemanda: Double, demandaMensal: Double) -> Double {
        let economiaDeAguaAnualEmLitros = economiaDeAguaAnual(potencialMedioDeAtendimentoDaDemanda: potencialMedioDeAtendimentoDaDemanda, demandaMensal: demandaMensal)
        let economiaDeAguaMensalEmMetrosCubicos = economiaDeAguaAnualEmLitros / (1000 * 12) // Convertendo para m³
        return custoDaAgua(consumo: economiaDeAguaMensalEmMetrosCubicos) * 12
    }

    
    func tempoDeRetorno(volume: Double, potencialMedioDeAtendimentoDaDemanda: Double, demandaMensal: Double) -> Double {
        let economiaEfetivaAnual = economiaFinanceiraAnual(potencialMedioDeAtendimentoDaDemanda: potencialMedioDeAtendimentoDaDemanda, demandaMensal: demandaMensal) - opex
        return investimentoInicial(volume: volume) / economiaEfetivaAnual
    }
    
    // R$/m3
    func custoDaAgua(consumo: Double) -> Double {
        if consumo <= 10 {
            return (45.94 + 36.75 + 19.76) * consumo
        } else if consumo <= 15 {
            return (8.53 + 6.83 + 3.65) * consumo - 39.36 - 31.55 - 16.74
        } else if consumo <= 20 {
            return (8.72 + 6.98 + 3.75) * consumo - 42.41 - 33.8 - 18.24
        } else if consumo <= 25 {
            return (8.94 + 7.12 + 3.86) * consumo - 46.41 - 36.6 - 20.44
        } else if consumo <= 30 {
            return (10.98 + 8.77 + 4.71) * consumo - 97.61 - 77.85 - 41.69
        } else if consumo <= 50 {
            return (11.68 + 9.34 + 5.03) * consumo - 118.61 - 94.95 - 51.29
        } else {
            return (17.93 + 14.3 + 7.7) * consumo - 413.11 - 342.25 - 184.79
        }
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
