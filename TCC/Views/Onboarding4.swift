//
//  Onboarding4.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 21/05/24.
//

import SwiftUI

struct Onboarding4: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
        VStack {
            Text("Pra que serve esse APP?")
                .font(.title)
                .padding()
            
            Text("O intuito é fomentar a conscientização sobre práticas sustentáveis de uso da água e seus impactos benéficos no meio ambiente, incentivando a adoção do reaproveitamento de água pluvial como uma ação sustentável e socialmente responsável.")
                .padding(.horizontal, 32)
            
            Image(systemName: "leaf")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getWidth() * 0.2)
                .padding()
            
            Button("Começar") {
                isOnboarding = false
            }        }
    }
}

#Preview {
    Onboarding4()
}
