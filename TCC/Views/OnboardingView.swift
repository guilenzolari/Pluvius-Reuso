import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @State private var isAnimating: Bool = false
    let titulo: String
    let texto: String
    let imagem: String
    let cor: Color
    let mostrarBotaoComecar: Bool
    
    var body: some View {
        ZStack {
            cor
                .opacity(0.4)
                .ignoresSafeArea()
            
            VStack {
                Text(titulo)
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding()
                
                Text(texto)
                    .padding(.horizontal, 32)
                    .multilineTextAlignment(.center)
                
                Image(systemName: imagem)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: getWidth() * 0.2)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                    .padding()
                
                if mostrarBotaoComecar {
                    Button("Começar") {
                        isOnboarding = false
                    }
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding()
                }
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1)) {
                isAnimating = true
            }
        }
        .onDisappear {
            isAnimating = false
        }
    }
}
