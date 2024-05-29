import SwiftUI

struct OnboardingManagerView: View {
    @State private var currentTab = 0
    var dadosOnboarding = onboardingContent
    
    var body: some View {
        TabView(selection: $currentTab) {
            ForEach(0..<dadosOnboarding.count, id: \.self) { index in
                OnboardingView(titulo: dadosOnboarding[index].titulo,
                               texto: dadosOnboarding[index].texto,
                               imagem: dadosOnboarding[index].image,
                               cor: dadosOnboarding[index].color,
                               mostrarBotaoComecar: dadosOnboarding[index].mostrarBotaoComecar)
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct Onboarding: Identifiable {
    var id = UUID()
    var titulo: String
    var texto: String
    var image: String
    var color: Color
    var mostrarBotaoComecar: Bool
}
