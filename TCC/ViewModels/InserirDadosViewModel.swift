//
//  ContasController.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 23/04/24.
//

import Foundation

final class InserirDadosViewModel: ObservableObject {
    
    static let shared = InserirDadosViewModel()
    
    @Published var area: Double = 0.0 // m2
    @Published var tarifaDaAgua: Double = 0.0 // R$/m3
    @Published var consumoMediaDaResidencia: Double = 0.0 // m3/mes
    @Published var quantidadeMoradoresDaResidencia = 0.0
    
    var areaString: String {
        get { area == 0 ? "" : String(area) }
        set { area = Double(newValue) ?? 0 }
    }
    
    var tarifaDaAguaString: String {
        get { tarifaDaAgua == 0 ? "" : String(tarifaDaAgua) }
        set { tarifaDaAgua = Double(newValue) ?? 0 }
    }
    
    var consumoMediaDaResidenciaString: String {
        get { consumoMediaDaResidencia == 0 ? "" : String(consumoMediaDaResidencia) }
        set { consumoMediaDaResidencia = Double(newValue) ?? 0 }
    }
    
    var quantidadeMoradoresDaResidenciaString: String {
        get { quantidadeMoradoresDaResidencia == 0 ? "" : String(quantidadeMoradoresDaResidencia) }
        set { quantidadeMoradoresDaResidencia = Double(newValue) ?? 0 }
    }
    
    private init(){}
    
    func isTextFieldFilled() -> Bool{
        if(area == 0 || tarifaDaAgua == 0 || (consumoMediaDaResidencia == 0 && quantidadeMoradoresDaResidencia == 0)){
            return false
        } else {
            return true
        }
    }
}
