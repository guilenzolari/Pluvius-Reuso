//
//  V.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 06/06/24.
//

import SwiftUI

struct ProblemaDaAguaNoMundoView: View {
    let text = ["A crise da água é um dos maiores desafios globais do século XXI. A escassez de água potável afeta bilhões de pessoas em todo o mundo, comprometendo a saúde, o bem-estar e o desenvolvimento econômico. A combinação de crescimento populacional, mudanças climáticas e poluição tem pressionado os recursos hídricos, tornando a água limpa e acessível cada vez mais rara.","Em muitas regiões, a falta de água adequada para consumo humano, saneamento e agricultura tem levado a crises humanitárias e conflitos. Além disso, a má gestão dos recursos hídricos e o desperdício agravam ainda mais a situação, colocando em risco a sustentabilidade do nosso planeta.", "No entanto, soluções inovadoras como a reutilização da água da chuva podem ajudar a mitigar esses problemas. O aplicativo Pluvius Reuso é uma ferramenta essencial para promover a conscientização e a implementação de práticas sustentáveis, permitindo que mais pessoas contribuam para a preservação desse recurso vital. Junte-se a nós na luta por um futuro mais sustentável e faça a diferença com Pluvius Reuso. Cada gota conta!"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(text, id: \.self) {texto in
                    Text(texto)
                }
            }.padding()
            
            HStack{
                Spacer()
                Image(systemName: "globe.americas")
                    .resizable()
                    .foregroundStyle(Color.blue)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: getWidth() * 0.3)
                    .padding()
                Spacer()
            }
            
        }.navigationTitle(Text("Problema da Água no Mundo"))
    }
}

#Preview {
    ProblemaDaAguaNoMundoView()
}
