//
//  EscolhaDePerfilViewModel.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 30/05/24.
//

import Foundation

struct EscolhaDePerfilViewModel {
    
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
        var melhorPotencial = dados[0].potencialMedioDeAtendimentoDaDemanda
        
        for (i, dado) in dados.enumerated() {
            let potencialAtual = dado.potencialMedioDeAtendimentoDaDemanda
            if potencialAtual > melhorPotencial {
                melhorPotencial = potencialAtual
                index = i
            }
        }
        return index
    }

}
