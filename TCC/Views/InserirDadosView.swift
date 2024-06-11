import SwiftUI

struct InserirDadosView: View {
    
    @ObservedObject var inputs = InserirDadosViewModel.shared
    @State var isTextFieldFilled = false
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    
                    Section(header: Text("Demanda"), footer: Text("Pode ser encontrado na conta de água da sua residência.")) {
                        TextField("Consumo médio mensal de água (m³)", text: $inputs.consumoMediaDaResidenciaString)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(footer: Text("Quantas pessoas utilizam a mesma rede de água na sua residência.")) {
                        TextField("Quantidade de moradores", text: $inputs.quantidadeMoradoresDaResidenciaString)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(header: Text("Coleta"), footer: Text("Área da superfície utilizada para coletar água da chuva (ex: telhados, lajes, calhas).")) {
                        TextField("Área de Captação (m²)", text: $inputs.areaString)
                            .keyboardType(.numberPad)
                    }
                    
                    Section {
                        NavigationLink(destination: EscolhaDePerfilView(selectedTab: $selectedTab)) {
                            Text("Simular")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: 44)
                                .cornerRadius(8)
                        }
                        .disabled(!inputs.isTextFieldFilled())
                    }.listRowBackground(inputs.isTextFieldFilled() ? Color.blue : Color.gray)
                }
            }
            .navigationTitle(Text("Dados da residência"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

