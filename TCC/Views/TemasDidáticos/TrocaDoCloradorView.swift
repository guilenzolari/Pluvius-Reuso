//
//  TrocaDoCloradorView.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 18/06/24.
//

import SwiftUI

struct TrocaDoCloradorView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20) {
                Text("O clorador é crucial para garantir a qualidade da água armazenada. Ele adiciona cloro à água para desinfecção, prevenindo a contaminação por microorganismos. A troca do clorador deve ser realizada regularmente para manter a eficácia do tratamento da água. Os passos para a troca do clorador incluem:")
                
                Text("• Monitoramento da qualidade da água.")
                Text("• Identificação da necessidade de troca do clorador.")
                Text("• Aquisição de um novo clorador.")
                Text("• Substituição do clorador antigo pelo novo.")
                Text("• Continuação do tratamento da água para assegurar a sua qualidade.")
                
                Text("A regularidade da troca do clorador depende do volume de água tratado e da frequência de uso do sistema. É essencial seguir as recomendações do fabricante para garantir a concentração adequada de cloro na água, evitando tanto a subdosagem, que pode resultar em contaminação, quanto a superdosagem, que pode causar problemas de saúde e danos ao sistema de encanamento. A documentação e o registro das trocas realizadas podem ajudar a manter um histórico de manutenção, facilitando a gestão do sistema.")
                
            }.padding()
            
            
        }.navigationTitle(Text("Troca do Clorador"))
    }
}

#Preview {
    TrocaDoCloradorView()
}
