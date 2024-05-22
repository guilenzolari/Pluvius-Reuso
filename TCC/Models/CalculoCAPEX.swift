//
//  CalculoCAPEX.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 03/05/24.
//

import Foundation

class CalculoCAPEX {
    
    let custoReservatorio600 = 1420.63
    let custoReservatorio1000 = 1844.5
    let custoReservatorio2000 = 3498.33
    let custoReservatorio5000 =  5782.45
    
    func custoTotalReservatorios(volume: Double) -> Double {
        if volume <= 600 {
            return custoReservatorio600
        } else if volume <= 1000 {
            return custoReservatorio1000
        } else if volume <= 1600 {
            return custoReservatorio1000 + custoReservatorio600
        } else if volume <= 2000 {
            return custoReservatorio2000
        } else if volume <= 3000 {
            return custoReservatorio1000 + custoReservatorio2000
        } else if volume <= 5000 {
            return custoReservatorio5000
        } else if volume <= 7000 {
            return custoReservatorio5000 + custoReservatorio2000
        } else if volume <= 10000 {
            return custoReservatorio5000*2
        } else {
            return Double(Int(volume/5000)+1) * custoReservatorio5000
        }
    }
}
