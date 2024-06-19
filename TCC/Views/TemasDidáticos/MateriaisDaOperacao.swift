//
//  MateriaisDaOperacao.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 18/06/24.
//

import SwiftUI

struct MateriaisDaOperacao: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Para a operação eficiente do sistema de captação de água pluvial, diversos materiais são necessários. Esses materiais incluem:")
                
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("**Calhas**: Para coletar a água da chuva que cai sobre os telhados.")
                    Text("**Filtros**: Para remover impurezas e partículas da água coletada.")
                    Text("**Reservatórios**: Para armazenar a água filtrada.")
                    Text("**Bombas**: Para transferir a água armazenada para os pontos de uso.")
                    Text("**Sistemas de tratamento (cloradores)**: Para garantir a qualidade da água armazenada, adicionando cloro para desinfecção.")
                }
                
                Text("Esses materiais devem ser de alta durabilidade e de fácil manutenção para garantir a eficiência e a longevidade do sistema. Além disso, a escolha dos materiais deve considerar a resistência a condições climáticas adversas e a capacidade de armazenamento suficiente para cobrir períodos de baixa precipitação. A instalação de medidores e sensores pode ajudar a monitorar o desempenho do sistema, detectando possíveis falhas e otimizando o uso dos recursos disponíveis.")
                Spacer()
            }.padding()
            
            
        }.navigationTitle(Text("Materiais da Operação"))
    }
}

#Preview {
    MateriaisDaOperacao()
}
