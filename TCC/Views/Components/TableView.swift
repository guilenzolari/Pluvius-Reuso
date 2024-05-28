import SwiftUI

struct TableView: View {
    let titles = ["Capacidade do\nReservatório",
                  "Potencial de\natendimento\nda demanda",
                  "Investimento \nInicial (R$)",
                  "Tempo de Retorno\ndo Investimento\n(anos)"]
    @Binding var dadosSimulacao: [SumarioDados]
    var calculosReservatorios = CalculosReservatorios()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Grid {
                    GridRow {
                        ForEach(titles, id: \.self) { title in
                            Text(title)
                                .bold()
                                .multilineTextAlignment(.center)
                        }
                    }
                    Divider()
                    ForEach(dadosSimulacao.indices, id: \.self) { index in
                        let dado = dadosSimulacao[index]
                        GridRow {
                            Text("\(String(format: "%.0f", dado.capacidadeReservatorio))")
                            Text("\(String(format: "%.2f", dado.potencialMedioDeAtendimentoDaDemanda * 100))%")
                            Text("A")
                            Text("B")
                            NavigationLink {
                                DetalhesSimulacaoView(dado: dado)
                            } label: {
                                Text(Image(systemName: "chevron.right"))
                            }
                        }
                        if index != dadosSimulacao.indices.last {
                            Divider()
                        }
                    }
                }
            }
        }
    }
}
