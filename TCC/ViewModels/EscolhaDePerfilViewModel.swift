//
//  EscolhaDePerfilViewModel.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 30/05/24.
//

import Foundation

struct EscolhaDePerfilViewModel {
    
    func indiceMenorCustoDeImplementacao(dados: [SumarioDadosTotais]) -> Int {
        guard !dados.isEmpty else {
            return -1
        }
        
        var index = 0
        var menorCusto = dados[0].investimentoInicial
        
        for (i, dado) in dados.enumerated() {
            if dado.investimentoInicial < menorCusto {
                menorCusto = dado.investimentoInicial
                index = i
            }
        }
        
        return index
    }

    
    func indicePerfilBalanceado(dados: [SumarioDadosTotais]) -> Int {
        guard !dados.isEmpty else {
            return -1
        }
        var index = 0
        var menorTempoDeRetorno = dados[0].tempoDeRetorno
        
        for (i, dado) in dados.enumerated() {
            if dado.tempoDeRetorno < menorTempoDeRetorno {
                menorTempoDeRetorno = dado.tempoDeRetorno
                index = i
            }
        }
        
        return index
    }

    
    func indicePerfilEcoAgua(dados: [SumarioDadosTotais]) -> Int {
        guard !dados.isEmpty else {
            // Retorna -1 se a lista estiver vazia, indicando que não há dados para processar
            return -1
        }
        
        var index = 0
        var melhorRazao = dados[0].potencialMedioDeAtendimentoDaDemanda / dados[0].capacidadeReservatorio
        
        for (i, dado) in dados.enumerated() {
            let razaoAtual = dado.potencialMedioDeAtendimentoDaDemanda / dado.capacidadeReservatorio
            if razaoAtual > melhorRazao {
                melhorRazao = razaoAtual
                index = i
            }
        }
        
        return index
    }

}
