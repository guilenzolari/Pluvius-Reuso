//
//  Onboarding1.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 21/05/24.
//

import SwiftUI

struct Onboarding1: View {
    var body: some View {
        VStack {
            Text("Qual a finalidade desse APP?")
                .font(.title)
                .padding()
            
            Text("O propósito desse aplicativo é avaliar os custos e a viabilidade da implementação de sistemas de reutilização de água pluvial em unidades residenciais na cidade de Campinas.")
                .padding(.horizontal, 32)
            
            Image(systemName: "dollarsign.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getWidth() * 0.2)
                .padding()
        }
    }
}

#Preview {
    Onboarding1()
}
