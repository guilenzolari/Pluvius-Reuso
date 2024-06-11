//
//  ComoCalcularAreaCaptacaoView.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 07/06/24.
//

import SwiftUI

struct ComoCalcularAreaCaptacaoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Calcular a área de captação de água da chuva é essencial para dimensionar corretamente sistemas de aproveitamento de água pluvial. Veja como fazer isso de forma simples:")
                
                Text("1. Identifique a Área de Captação")
                    .font(.headline)
                Text("Geralmente, a área de captação é o telhado de uma casa ou edifício. Meça o comprimento e a largura da superfície do telhado. Se o telhado for inclinado, considere apenas a projeção horizontal (vista de cima).")
                    .font(.body)
                
                Text("2. Calcule a Área")
                    .font(.headline)
                Text("Multiplique o comprimento pela largura para obter a área em metros quadrados (m²).")
                    .font(.body)
                
                HStack {
                    Spacer()
                    Text("Área = Comprimento × Largura")
                        .bold()
                    Spacer()
                }
                
                Text("3. Considere as Partes Separadas")
                    .font(.headline)
                Text("Se o telhado tiver diferentes seções (como telhados em níveis diferentes ou com várias inclinações), meça e calcule a área de cada seção separadamente e depois some todas as áreas.")
                    .font(.body)
                
                Text("4. Verifique Obstáculos")
                    .font(.headline)
                Text("Subtraia áreas que não contribuem para a captação, como claraboias, chaminés ou outras estruturas.")
                    .font(.body)
                
                Text("5. Resultado Final")
                    .font(.headline)
                Text("O valor obtido é a área total de captação de água da chuva.")
                    .font(.body)
                
            }.padding()
        }.navigationTitle(Text("Como calcular a área de captação"))
    }
}

#Preview {
    ComoCalcularAreaCaptacaoView()
}
