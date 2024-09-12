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
                .foregroundStyle(Color.gray)
            Spacer()
            Text(valor)
        }
    }
}


#Preview {
    LinhaTabelaHorizontal(campo: "Percentual de substituição", valor: "30%")
}
