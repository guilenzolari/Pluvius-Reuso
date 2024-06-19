//
//  LimitacoesDoProcessoView.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 18/06/24.
//

import SwiftUI

struct LimitacoesDoProcessoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("O sistema de captação de água pluvial possui algumas limitações que devem ser consideradas. Essas limitações incluem:")
                
                Text("**• Variabilidade da precipitação**: A quantidade de água coletada depende das condições climáticas, que podem variar ao longo do ano.")
                Text("**• Necessidade de manutenção regular**: Os componentes do sistema, como calhas, filtros e reservatórios, requerem manutenção para garantir seu funcionamento eficiente.")
                Text("**• Atenção a contaminação da água**: Os usos da água devem ser exclusivamente para fins secundários, não sendo possível o uso para consumo humano ou consumo animal.")
                Text("**• Custos financeiros:** O custo inicial de instalação e os custos operacionais contínuos podem ser significativos.")
                
                Text("Essas limitações devem ser levadas em conta na análise da viabilidade técnica e econômica do sistema de captação de água pluvial. Além disso, é importante considerar a legislação local e as diretrizes ambientais que podem influenciar a implementação do sistema. A falta de incentivos fiscais ou subsídios pode tornar o investimento inicial mais desafiador para algumas famílias.")
                
                Text("No entanto, os benefícios a longo prazo, como a redução na conta de água e a contribuição para a sustentabilidade ambiental, podem compensar esses desafios, tornando a captação de água pluvial uma opção viável e benéfica para muitas residências. O Pluvius Reuso te ajuda! Insira seus dados e verifique a viabilidade de seu projeto.")

                
            }.padding()
        }.navigationTitle(Text("Limitações do Processo"))
    }
}

#Preview {
    LimitacoesDoProcessoView()
}
