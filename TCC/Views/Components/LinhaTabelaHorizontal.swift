//
//  LinhaTabelaHorizontal.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 27/05/24.
//

import SwiftUI

struct LinhaTabelaHorizontal: View {
    @State var campo: String
    @State var valor: String
    
    var body: some View {
        HStack{
            Text(campo)
            Spacer()
            Text(valor)
        }.padding(.horizontal)
            .padding(.vertical, 5)
    }
}

#Preview {
    LinhaTabelaHorizontal(campo: "Percentual de substituição", valor: "30%")
}
