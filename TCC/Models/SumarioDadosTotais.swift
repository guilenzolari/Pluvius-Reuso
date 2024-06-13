//
//  SumarioDadosTotais.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 13/06/24.
//

import Foundation

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
