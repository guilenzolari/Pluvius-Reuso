import SwiftUI

struct InserirDadosView: View {
    
    @ObservedObject var inputs = InserirDadosViewModel.shared
    @State var isTextFieldFilled = false
    @Binding var selectedTab: Int

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Coleta"), footer: Text("Área da superfície utilizada para coletar água da chuva (ex: telhados, lajes, calhas).")) {
                        TextField("Área de Captação (m²)", text: $inputs.areaString)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(footer: Text("Valor encontrado na conta de água. Pode variar com o consumo e localização.")) {
                        TextField("Preço da água (R$/m³)", text: $inputs.tarifaDaAguaString)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(header: Text("Demanda"), footer: Text("Preencha apenas um dos campos acima. Preencher 'Consumo mensal de água' dá resultados mais precisos.")) {
                        TextField("Consumo médio mensal de água (m³)", text: $inputs.consumoMediaDaResidenciaString)
                            .keyboardType(.numberPad)
                            .disabled(inputs.quantidadeMoradoresDaResidencia != 0)
                        
                        TextField("Quantidade de moradores", text: $inputs.quantidadeMoradoresDaResidenciaString)
                            .keyboardType(.numberPad)
                            .disabled(inputs.consumoMediaDaResidencia != 0)
                    }
                    
                    Section {
                        Button(action: {
                            selectedTab = 1
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Concluir")
                                Spacer()
                            }
                        }).disabled(!inputs.isTextFieldFilled())
                    }
                }
            }
            .navigationTitle(Text("Insira os dados da sua residência"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
