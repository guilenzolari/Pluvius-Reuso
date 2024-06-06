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
        ("Janeiro", 245.5),
        ("Fevereiro", 144.85),
        ("Março", 25.25),
        ("Abril", 165.65),
        ("Maio", 221.85),
        ("Junho", 84.5),
        ("Julho", 7.75),
        ("Agosto", 8.0),
        ("Setembro", 105.05),
        ("Outubro", 61.8),
        ("Novembro", 94.35),
        ("Dezembro", 233.3)]
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text(texto1)
                    .padding()
                Text(texto2)
                    .padding()
                Text(texto3)
                    .padding()
                Text(texto4)
                    .padding()
            }
        }
        
    }
}

#Preview {
    IndicePluviometricoView()
}
