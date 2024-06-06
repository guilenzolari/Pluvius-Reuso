import SwiftUI
import Charts

struct TemasDidaticosView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    Section {
                        BotaoTemasDidaticos(destino: UsosDaAguaTratada(),
                                            imagem: "gearshape",
                                            texto: "Funcionamento do Processo",
                                            cor: .gray)
                        BotaoTemasDidaticos(destino: UsosDaAguaTratada(),
                                            imagem: "spigot",
                                            texto: "Usos da Água Tratada",
                                            cor: .orange)
                        
                        BotaoTemasDidaticos(destino: UsosDaAguaTratada(),
                                            imagem: "drop",
                                            texto: "Problema da Água no Mundo",
                                            cor: .blue)
                        BotaoTemasDidaticos(destino: UsosDaAguaTratada(),
                                            imagem: "cloud.drizzle",
                                            texto: "Índice pluviométrico",
                                            cor: .indigo)
                        BotaoTemasDidaticos(destino: UsosDaAguaTratada(),
                                            imagem: "shippingbox",
                                            texto: "Materiais da Operação",
                                            cor: .brown)
                        BotaoTemasDidaticos(destino: UsosDaAguaTratada(),
                                            imagem: "arrow.circlepath",
                                            texto: "Troca do Clorador",
                                            cor: .black)
                        BotaoTemasDidaticos(destino: UsosDaAguaTratada(),
                                            imagem: "rectangle",
                                            texto: "Como calcular a área de captação",
                                            cor: .red)
                        BotaoTemasDidaticos(destino: UsosDaAguaTratada(),
                                            imagem: "exclamationmark.triangle",
                                            texto: "Limitações do projeto",
                                            cor: Color.yellow)
                    }
                }
            }.navigationTitle(Text("Temas Didáticos"))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

