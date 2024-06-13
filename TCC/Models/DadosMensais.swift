//
//  DadosMensais.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 13/06/24.
//

import Foundation

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
