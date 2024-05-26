//
//  Onboarding3.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 21/05/24.
//

import SwiftUI

struct Onboarding3: View {
    var body: some View {
        VStack {
            Text("E se eu não souber sobre processos químicos?")
                .font(.title)
                .padding()
            
            Text("O aplicativo oferece uma descrição detalhada do processo de reaproveitamento da água da chuva, fornecendo informações educacionais aos usuários para uma compreensão abrangente do tema.")
                .padding(.horizontal, 32)
            
            Image(systemName: "book.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getWidth() * 0.2)
                .padding()
        }
    }
}

#Preview {
    Onboarding3()
}
