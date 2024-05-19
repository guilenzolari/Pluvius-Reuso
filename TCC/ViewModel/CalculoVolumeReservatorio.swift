//
//  AnaliseDeViabilidadeController.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 28/04/24.
//

import Foundation

class CalculoVolumeReservatorio: ObservableObject {
    let coeficienteRunoff = 0.9
    let porcentagemSubstituidaPorAguaPluvial = 0.4
    let consumoMedioPorPessoa = 156.0 // pessoa/L
    let mesesDoAno = [
          "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho",
          "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
      ]
    let mediaMensalPrecipitacao: [Double] = [
        178.1,258.8,81.3,12.2,23.4,27.1,0,15.5,6.6,121.4,83.8,168.1,312.9,
168.4,130.8,40.1,39.4,15.7,8.9,28.2,89.7,120.4,142.5,324.1] //mm de chuva
    //custos reservatorio (R$)

    var precipitacaoMedia: Double // mm de chuva
    
    init(){
        precipitacaoMedia = mediaMensalPrecipitacao.reduce(0, +)/Double(mediaMensalPrecipitacao.count)
    }
    
    func DemandaAguaPluvialMensal(consumoMedioDaResidencia: String, quantidadeMoradores: String) -> Double {
        if consumoMedioDaResidencia.isEmpty{
            //usando a quantidade de pessoas
            return Double(quantidadeMoradores)!*consumoMedioPorPessoa*porcentagemSubstituidaPorAguaPluvial*30
        } else {
            //usando o consumo medio da residencia
            return Double(consumoMedioDaResidencia)!*porcentagemSubstituidaPorAguaPluvial
        }
    }
    
    func volumeReservatorioMetodoMedia(areaDeCaptacao: String) -> Double{
        return precipitacaoMedia*Double(areaDeCaptacao)!*coeficienteRunoff
    }
    
    func volumeDeAguaPluvialCaptado(mediaMensalPrecipitacao: [Double], areaDeCaptacao: String) -> [Double] {
        var volumeDeAguaPluvialCaptado: [Double] = []
        
        for precipitacao in mediaMensalPrecipitacao {
            volumeDeAguaPluvialCaptado.append(precipitacao*Double(areaDeCaptacao)!*coeficienteRunoff)
        }
        return volumeDeAguaPluvialCaptado
    }
    
    func acumuloReservatorioEmCadaMes(mediaMensalPrecipitacao: [Double], areaDeCaptacao: String, consumo: Double) -> [Double] {
        var acumulo: [Double] = []
        let volumeCaptado = volumeDeAguaPluvialCaptado(mediaMensalPrecipitacao: mediaMensalPrecipitacao, areaDeCaptacao: areaDeCaptacao)

        for entrada in volumeCaptado {
            acumulo.append(entrada-consumo)
        }
            
        return acumulo
    }

    func volumeReservatorioMetodoRippl(mediaMensalPrecipitacao: [Double], areaDeCaptacao: String, consumo: Double) -> Double {
        let acumulo = acumuloReservatorioEmCadaMes(mediaMensalPrecipitacao: mediaMensalPrecipitacao, areaDeCaptacao: areaDeCaptacao, consumo: consumo)
        
        let somaPositivos = acumulo.reduce(0) { (result, value) -> Double in
            return value > 0 ? result + value : result
        }
        
        return somaPositivos
    }
}
