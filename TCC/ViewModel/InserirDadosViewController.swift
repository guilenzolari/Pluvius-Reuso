//
//  ContasController.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 23/04/24.
//

import Foundation

class InserirDadosViewController: ObservableObject {
    @Published var area: Double = 0.0 // m2
    @Published var tarifaDaAgua: Double = 0.0 // R$/m3
    @Published var consumoMediaDaResidencia: Double = 0.0 // m3/mes
    @Published var quantidadeMoradoresDaResidencia = 0.0
    @Published var percentualAguaSubstituida = 0.0
    @Published var volumeMaximoTanque = 0.0
    
    func isTextFieldFilled() -> Bool{
        if(area == 0 || tarifaDaAgua == 0 || (consumoMediaDaResidencia == 0 && quantidadeMoradoresDaResidencia == 0)){
            return false
        } else {
            return true
        }
    }
}
