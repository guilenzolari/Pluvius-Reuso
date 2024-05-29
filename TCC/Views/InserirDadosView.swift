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
                        
                        Section(header: Text("Percentual de substituição"), footer: Text("O Percentual de Substituição da água potável pela água pluvial indica a proporção de água potável que será substituída pela água captada pelo sistema de tratamento projetado. Os valores típicos variam de 20% a 30%. Neste aplicativo, utilizamos o valor padrão de 25%. Valores fora desse intervalo devem ser utilizados com cautela.")){
                            CustomSliderView()
                        }
                        
                        Section {
                            NavigationLink {
                                EscolhaDePerfilView(selectedTab: $selectedTab)
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("Visualizar simulações")
                                    Spacer()
                                }
                            }.disabled(!inputs.isTextFieldFilled())
                        }
                    }
                }
            .navigationTitle(Text("Insira os dados da sua residência"))
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}
