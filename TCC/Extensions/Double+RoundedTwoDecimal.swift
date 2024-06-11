//
//  Double+RoundedTwoDecimal.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 23/05/24.
//

import Foundation

extension Double {
    func roundedTwoDecimal() -> Double {
        return (self * 100).rounded()/100
    }
}
