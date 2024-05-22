//
//  CalculosReservatoriosViewModel.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 21/05/24.
//

import Foundation

class CalculosReservatoriosViewModel: ObservableObject {
    var volumeDeAguapluvialCaptada: [Double] = []
    var volumeDisponivelReservatorioPosCaptacaoPreConsumo: [Double] = []
    var volumeReservatorioPosConsumo: [Double] = []
    var potencialDeAtendimentoDaDemanda: [Double] = []
    var calculosModel = CalculosReservatorios()
    
    let percentualDeSubstituicao = [0.25, 0.3, 0.35, 0.4, 0.45]
    
    
}
