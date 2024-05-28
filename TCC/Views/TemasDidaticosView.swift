import SwiftUI
import Charts

struct TemasDidaticosView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    Section {
                        BotaoTemasDidaticos(destino: Text("AAA"),
                                            imagem: "gearshape",
                                            texto: "Funcionamento do Processo",
                                            cor: .gray)
                        BotaoTemasDidaticos(destino: Text("AA"),
                                            imagem: "spigot",
                                            texto: "Usos da Água Tratada",
                                            cor: .orange)
                        
                        BotaoTemasDidaticos(destino: Text("AAA"),
                                            imagem: "drop",
                                            texto: "Problema da Água no Mundo",
                                            cor: .blue)
                        BotaoTemasDidaticos(destino: Text("AAA"),
                                            imagem: "cloud.drizzle",
                                            texto: "Índice Pluviométrico",
                                            cor: .indigo)
                    }
                }
            }.navigationTitle(Text("Temas Didáticos"))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

