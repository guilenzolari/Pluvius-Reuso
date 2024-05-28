//
//  BotaoTemasDidaticos.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 28/05/24.
//

import SwiftUI

struct BotaoTemasDidaticos<Destination: View>: View {
    var destino: Destination
    var imagem: String
    var texto: String
    var cor: Color
    
    var body: some View {
        NavigationLink(destination: destino) {
            HStack {
                Image(systemName: imagem).bold()
                    .foregroundStyle(cor)
                Text(texto)
                Spacer()
            }.padding()
        }
    }
}
