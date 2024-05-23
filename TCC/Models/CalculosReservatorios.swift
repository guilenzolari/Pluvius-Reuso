//
//  AnaliseDeViabilidadeController.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 28/04/24.
//

import Foundation
import SwiftUI

class CalculosReservatorios: ObservableObject {
    
    let consumoMedioPessoa: Double = 156 // Litros/dia*pessoa
    let coeficienteAproveitamento: Double = 0.8
    let precipitacaoMensal: [Double] = [178.1, 258.8, 81.3, 12.2, 23.4, 27.1, 0, 15.5, 6.6, 121.4, 83.8, 168.1, 312.9, 168.4, 130.8, 40.1, 39.4, 15.7, 8.9, 28.2, 89.7, 120.4, 142.5, 324.1]
    let percentualDeSubstituicao = [0.25, 0.3, 0.35, 0.4, 0.45]
    let volumesTanques = [600, 1000, 1600, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000]
    
    @ObservedObject var inputs = InserirDadosViewModel.shared
    
    //funcoes calculo do mes
    func demandaAguaPluvialMensal(percentualSunstituicao: Double) -> Double {
        var demandaAguaPluvialMensal: Double = 0
        if inputs.quantidadeMoradoresDaResidencia == 0 {
            demandaAguaPluvialMensal = inputs.quantidadeMoradoresDaResidencia * consumoMedioPessoa * percentualSunstituicao * (365/12)
            return demandaAguaPluvialMensal
        } else {
            demandaAguaPluvialMensal = inputs.consumoMediaDaResidencia * percentualSunstituicao
            return demandaAguaPluvialMensal
        }
    }
    
    //funcoes de cada celula
    func volumeCapatadoNosMeses(precipitacaoDoMes: Double) -> Double {
        return precipitacaoDoMes * coeficienteAproveitamento * inputs.area
    }

    func volumeDisponivelReservatorioPosCaptacaoPreConsumo(volumeReservatorio: Double, volumeReservatorioPosConsumo: Double, volumeCaptado: Double) -> Double {
        return min(volumeReservatorio, volumeReservatorioPosConsumo + volumeCaptado)
    }
    
    func volumeReservatorioPosConsumo(volumeDisponivelReservatorioPosCaptacaoPreConsumo: Double, demandaAguaPluvialMensal: Double) -> Double {
        if volumeDisponivelReservatorioPosCaptacaoPreConsumo - demandaAguaPluvialMensal < 0 {
            return 0
        } else {
            return volumeDisponivelReservatorioPosCaptacaoPreConsumo - demandaAguaPluvialMensal
        }
    }
    
    func volumeDeAguaConsumido(volumeDisponivelReservatorioPosCaptacaoPreConsumo: Double, demandaAguaPluvialMensal: Double) -> Double {
        return min(volumeDisponivelReservatorioPosCaptacaoPreConsumo, demandaAguaPluvialMensal)
    }
    
    func potencialDeAtendimentoDaDemanda(volumeDeAguaConsumido: Double, demandaAguaPluvialMensal: Double) -> Double {
        return volumeDeAguaConsumido / demandaAguaPluvialMensal
    }
    
    //calculo das linhas
    func calculosDoMes(index: Int, volumeReservatorio: Double, percentual: Double) -> DadosConsumoMes {
        let volumeDeAguapluvialCaptada = volumeCapatadoNosMeses(precipitacaoDoMes: precipitacaoMensal[index])
        let volumeDisponivelReservatorioPosCaptacaoPreConsumo1: Double
        if index == 0 {
            volumeDisponivelReservatorioPosCaptacaoPreConsumo1 = volumeDisponivelReservatorioPosCaptacaoPreConsumo(volumeReservatorio: volumeReservatorio,
                                                                                                                  volumeReservatorioPosConsumo: 0,
                                                                                                                  volumeCaptado: volumeDeAguapluvialCaptada)
        } else {
            volumeDisponivelReservatorioPosCaptacaoPreConsumo1 = volumeDisponivelReservatorioPosCaptacaoPreConsumo(volumeReservatorio: volumeReservatorio,
                                                                                                                  volumeReservatorioPosConsumo: calculosDoMes(index: index - 1,
                                                                                                                                                              volumeReservatorio: volumeReservatorio,
                                                                                                                                                              percentual: percentual).volumeReservatorioPosConsumo,
                                                                                                                  volumeCaptado: volumeDeAguapluvialCaptada)
        }
        let demandaDeAgua = demandaAguaPluvialMensal(percentualSunstituicao: percentual)
        let volumeReservatorioPosConsumo = volumeReservatorioPosConsumo(volumeDisponivelReservatorioPosCaptacaoPreConsumo: volumeDisponivelReservatorioPosCaptacaoPreConsumo1,
                                                                        demandaAguaPluvialMensal: demandaDeAgua)
        let volumeDeAguaConsumido = volumeDeAguaConsumido(volumeDisponivelReservatorioPosCaptacaoPreConsumo: volumeReservatorioPosConsumo,
                                                          demandaAguaPluvialMensal: demandaDeAgua)
        let potencialDeAtendimentoDaDemanda = potencialDeAtendimentoDaDemanda(volumeDeAguaConsumido: volumeDeAguaConsumido, demandaAguaPluvialMensal: demandaDeAgua)
        
        return DadosConsumoMes(volumeDeAguapluvialCaptada: volumeDeAguapluvialCaptada,
                       volumeDisponivelReservatorioPosCaptacaoPreConsumo: volumeDisponivelReservatorioPosCaptacaoPreConsumo1,
                       demandaDeAgua: demandaDeAgua,
                       volumeReservatorioPosConsumo: volumeReservatorioPosConsumo,
                       volumeConsumido: volumeDeAguaConsumido,
                       potencialDeAtendimentoDaDemanda: potencialDeAtendimentoDaDemanda)
    }
    
//    func calculosDoAno(index: Int, precitacao: [Double], volumeReservatorio: Double, percentual: Double) -> SumarioDados {
//        
//    }
}

struct DadosConsumoMes {
    var volumeDeAguapluvialCaptada: Double
    var volumeDisponivelReservatorioPosCaptacaoPreConsumo: Double
    var demandaDeAgua: Double
    var volumeReservatorioPosConsumo: Double
    var volumeConsumido: Double
    var potencialDeAtendimentoDaDemanda: Double
}

struct SumarioDados {
    var percentual: Double
    var capacidadeReservatorio: Double
    var demandaAguaPluvialMensal: Double
    var potencialDeAtendimentoDaDemanda: Double
    var mesesAtendidosParcialmente: Double
    var mesesAtendidosCompletamente: Double
    var mesesNaoAtendidos: Double
}
