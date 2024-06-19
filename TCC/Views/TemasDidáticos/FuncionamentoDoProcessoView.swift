//
//  FuncionamentoDoProcessoView.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 18/06/24.
//

import SwiftUI

struct FuncionamentoDoProcessoView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("O sistema de captação de água pluvial em residências envolve a coleta da água da chuva que cai sobre os telhados. Esta água é canalizada por meio de calhas para um sistema de filtragem, onde impurezas e partículas são removidas. ")
                Text("A água filtrada é armazenada em reservatórios e pode ser utilizada para diversas finalidades não potáveis, como irrigação de jardins, lavagem de veículos e descarga de vasos sanitários. ")
                Text("O objetivo desse aplicativo é fornecer uma estimativa do quão eficiente será o uso da água da chuva, possibilitando a redução na dependência de fontes potáveis para essas atividades. Além disso, a integração do sistema com as tubulações existentes na residência permite uma transição suave entre o uso da água pluvial e a água fornecida pela rede pública, garantindo que sempre haja água disponível para as atividades diárias.")
                Spacer()
            }.padding()
        }.navigationTitle(Text("Funcionamento do Processo"))
    }
}

#Preview {
    FuncionamentoDoProcessoView()
}
