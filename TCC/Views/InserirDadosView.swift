import SwiftUI

struct InserirDadosView: View {
    
    @EnvironmentObject var contas: InserirDadosViewController
    @State var isTextFieldFilled = false
    @Binding var selectedTab: Int
    @State private var area: Double = 0.0
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Coleta"), footer: Text("Área da superfície utilizada para coletar água da chuva (ex: telhados, lajes, calhas).")) {
                        TextField("Área de Captação (m²)", value: $contas.area, formatter: numberFormatter)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(footer: Text("Valor encontrado na conta de água. Pode variar com o consumo e localização.")) {
                        TextField("Preço da água (R$/m³)", value: $contas.tarifaDaAgua, formatter: numberFormatter)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(footer: Text("Se não souber, deixe em branco. Valor padrão de 30% será usado.")) {
                        TextField("Percentual de água potável substituída (%)", value: $contas.percentualAguaSubstituida, formatter: numberFormatter)
                            .keyboardType(.numberPad)
                    }
                    
                    Section(header: Text("Demanda"), footer: Text("Preencha apenas um dos campos acima. Preencher 'Consumo mensal de água' dá resultados mais precisos.")) {
                        TextField("Consumo médio mensal de água (m³)", value: $contas.consumoMediaDaResidencia, formatter: numberFormatter)
                            .keyboardType(.numberPad)
                            .disabled(contas.quantidadeMoradoresDaResidencia != 0)
                        
                        TextField("Quantidade de moradores", value: $contas.quantidadeMoradoresDaResidencia, formatter: numberFormatter)
                            .keyboardType(.numberPad)
                            .disabled(contas.consumoMediaDaResidencia != 0)
                    }
                    
                    Section(header: Text("Armazenamento"), footer: Text("O volume máximo deve considerar o custo, área de instalação e demanda.")) {
                        TextField("Volume máximo do tanque (m³)", value: $contas.volumeMaximoTanque, formatter: numberFormatter)
                            .keyboardType(.numberPad)
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
                        }).disabled(!contas.isTextFieldFilled())
                    }
                }
            }
            .navigationTitle(Text("Insira os dados da sua residência"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
