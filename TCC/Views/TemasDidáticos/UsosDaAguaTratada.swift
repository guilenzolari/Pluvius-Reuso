//
//  SwiftUIView.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 31/05/24.
//

import SwiftUI

struct UsosDaAguaTratada: View {
    let titles = [
        "1. Irrigação de Jardins e Áreas Verdes",
        "2. Descarga em Vasos Sanitários",
        "3. Limpeza de Áreas Externas",
        "4. Uso em Sistemas de Refrigeração e Ar Condicionado",
        "5. Lavanderias",
        "6. Combate a Incêndios"
    ]
    
    let texts = [
        "A água da chuva é ideal para a irrigação de jardins, gramados e áreas verdes em geral. Por ser livre de cloro e outros tratamentos químicos comuns na água potável, ela é mais benéfica para as plantas. A utilização dessa água reduz a dependência de fontes potáveis, ajudando a conservar água tratada para outros fins essenciais.",
        "Um dos usos mais eficientes da água da chuva tratada é para descarga em vasos sanitários. Esse uso não requer água de alta qualidade potável, permitindo uma significativa economia de água tratada. Sistemas de encanamento podem ser adaptados para separar a água da chuva da água potável, otimizando a eficiência hídrica em edifícios residenciais e comerciais.",
        "A água da chuva tratada pode ser utilizada para a limpeza de calçadas, garagens, veículos e outras áreas externas. Esta prática não só conserva água potável, mas também pode ser mais econômica, uma vez que a água da chuva é, em sua essência, gratuita, exceto pelos custos de coleta e tratamento.",
        "Em sistemas industriais e comerciais, a água da chuva pode ser empregada em torres de resfriamento e sistemas de ar condicionado. Isso pode ajudar a reduzir a demanda por água potável e diminuir os custos operacionais.",
        "A água da chuva, após tratamento adequado, pode ser utilizada em lavanderias para lavar roupas. Esse uso pode ser particularmente vantajoso em instalações de grande escala, como hotéis, hospitais e lavanderias comerciais, onde a demanda por água é elevada.",
        "Em regiões onde a água potável é escassa, a água da chuva pode ser armazenada e usada para combate a incêndios. Ter reservatórios de água da chuva disponíveis pode ser uma medida estratégica importante para a segurança contra incêndios."
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("A água da chuva, quando devidamente coletada e tratada, pode ser uma fonte valiosa e sustentável para diversos usos secundários, contribuindo significativamente para a conservação de recursos hídricos potáveis. A seguir, são descritos alguns dos principais usos dessa água:")
                
                ForEach(0..<titles.count, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(titles[index])
                            .font(.headline)
                        Text(texts[index])
                            .font(.body)
                    }
                }
            }
            .padding()
        }.navigationTitle(Text("Usos da Água Tratada"))
    }
}

#Preview {
    UsosDaAguaTratada()
}

