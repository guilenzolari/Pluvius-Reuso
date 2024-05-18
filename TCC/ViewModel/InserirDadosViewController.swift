//
//  ContasController.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 23/04/24.
//

import Foundation

class InserirDadosViewController: ObservableObject {
    @Published var area = "" // m2
    @Published var tarifaDaAgua = "" // R$/m3
    @Published var consumoMediaDaResidencia = "" // m3/mes
    @Published var quantidadeMoradoresDaResidencia = ""
    
    func isTextFieldFilled() -> Bool{
        if(area.isEmpty || tarifaDaAgua.isEmpty || (consumoMediaDaResidencia.isEmpty && quantidadeMoradoresDaResidencia.isEmpty)){
            return false
        } else {
            return true
        }
    }
}
