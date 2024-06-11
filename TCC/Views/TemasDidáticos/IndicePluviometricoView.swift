//
//  IndicePluviometricoView.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 06/06/24.
//

import SwiftUI
import Charts

struct IndicePluviometricoView: View {
    let texto1 = "O índice pluviométrico é uma medida que indica a quantidade de precipitação (chuva) em um determinado período e local, geralmente expressa em milímetros (mm). Um índice pluviométrico de 1 mm significa que em uma área de um metro quadrado, houve uma precipitação de um litro de água. Essa medida é essencial para entender os padrões de chuva em uma região e é utilizada em diversas áreas, como agricultura, gestão de recursos hídricos e climatologia."
    
    let texto2 = "Campinas, localizada no estado de São Paulo, possui um regime de chuvas característico das regiões subtropicais. A cidade apresenta uma estação chuvosa bem definida, que ocorre principalmente no verão, entre os meses de novembro e março. Durante esse período, Campinas recebe a maior parte de sua precipitação anual, com índices pluviométricos elevados devido às chuvas intensas e frequentes."
    
    let texto3 = "No inverno, entre junho e agosto, o volume de chuvas é significativamente menor, resultando em um período de seca ou estiagem. As chuvas durante esses meses são esporádicas e de menor intensidade. Esse padrão de chuvas é influenciado por diversos fatores climáticos, incluindo a Zona de Convergência do Atlântico Sul (ZCAS) e frentes frias que passam pela região."

    let texto4 = "Em resumo, Campinas tem um regime de chuvas concentrado no verão, com altos índices pluviométricos, e um inverno mais seco, refletindo um padrão climático típico de áreas subtropicais."
    
    let precipitacao = [
            ("Jan", 245.5),
            ("Fev", 213.6),
            ("Mar", 106.05),
            ("Abr", 26.15),
            ("Mai", 31.4),
            ("Jun", 21.4),
            ("Jul", 4.45),
            ("Ago", 21.85),
            ("Set", 48.15),
            ("Out", 120.9),
            ("Nov", 113.15),
            ("Dez", 246.1)]

    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(texto1)
                Text(texto2)
                Text(texto3)
                
                VStack{
                    Text("Precipitação média em Campinas [mm]")
                        .fontWeight(.bold)
                    Text("(2020 - 2023)")
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                    Chart {
                        ForEach(precipitacao, id: \.0) { data in
                            BarMark(
                                x: .value("Mês", data.0),
                                y: .value("Precipitação (mm)", data.1)
                            ).cornerRadius(7)
                                .annotation(position: .top, alignment: .center) {
                                    Text("\(String(format: "%.1f", data.1))")
                                        .font(.caption)
                                    .foregroundStyle(Color.secondary)}
                                .foregroundStyle(Color.indigo.gradient)
                            
                        }
                    }
                    .frame(height: 300)
                }.padding()
            }.padding()
        }.navigationTitle(Text("Índice Pluviométrico"))
    }
}

#Preview {
    IndicePluviometricoView()
}
