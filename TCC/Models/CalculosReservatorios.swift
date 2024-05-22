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
    @EnvironmentObject var inputs: InserirDadosViewModel
    let mediaMensalPrecipitacao: [Double] = [
        178.1, 258.8, 81.3, 12.2, 23.4, 27.1, 0, 15.5, 6.6, 121.4,
        83.8, 168.1, 312.9, 168.4, 130.8, 40.1, 39.4, 15.7, 8.9, 28.2,
        89.7, 120.4, 142.5, 324.1
    ]
    
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

//        func volumesCaptadoNosMeses() -> [Double] {
//            var volumesCaptadosMeses: [Double] = []
//            for precipitacaoMensal in mediaMensalPrecipitacao {
//                let volumeDoMes = precipitacaoMensal * coeficienteAproveitamento * inputs.area
//                volumesCaptadosMeses.append(volumeDoMes)
//            }
//            return volumesCaptadosMeses
//        }
    
    func volumeCapatadoNosMeses(precipitacaoDoMes: Double) -> Double {
        return precipitacaoDoMes * coeficienteAproveitamento * inputs.area
    }

    func volumeDisponivelReservatorioPosCaptacaoPreConsumo(volumeReservatorio: Double, volumeReservatorioPosConsumo: Double, volumeCaptado: Double) -> Double{
        return min(volumeReservatorio, volumeReservatorioPosConsumo + volumeCaptado)
    }
    
    func volumeReservatorioPosConsumo(volumeDisponivelReservatorioPosCaptacaoPreConsumo: Double, demandaAguaPluvialMensal: Double) -> Double {
        if volumeDisponivelReservatorioPosCaptacaoPreConsumo - demandaAguaPluvialMensal < 0{
            return 0
        } else {
            return volumeDisponivelReservatorioPosCaptacaoPreConsumo - demandaAguaPluvialMensal
        }
    }
    
    func volumeDeAguaConsumido(volumeDisponivelReservatorioPosCaptacaoPreConsumo: Double, demandaAguaPluvialMensal: Double) -> Double {
        return min(volumeDisponivelReservatorioPosCaptacaoPreConsumo, demandaAguaPluvialMensal)
    }
    
    func potencialDeAtendimentoDaDemanda(volumeDeAguaConsumido: Double, demandaAguaPluvialMensal: Double) -> Double {
        return volumeDeAguaConsumido/demandaAguaPluvialMensal
    }
}
