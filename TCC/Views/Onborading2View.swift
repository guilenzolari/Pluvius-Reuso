//
//  Onborading2.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 21/05/24.
//

import SwiftUI

struct Onborading2: View {
    var body: some View {
        VStack {
            Text("Qual o uso da água tratada?")
                .font(.title)
                .padding()
            
            Text("A água coletada será direcionada para usos secundários, excluindo o consumo humano, tais como lavagem de calçadas, descargas e irrigação de plantas.")
                .padding(.horizontal, 32)
            
            Image(systemName: "drop.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getWidth() * 0.2)
                .padding()
        }
    }
}

#Preview {
    Onborading2()
}
