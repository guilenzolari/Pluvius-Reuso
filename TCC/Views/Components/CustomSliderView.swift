import SwiftUI

struct CustomSliderView: View {
    @ObservedObject var inputs = InserirDadosViewModel.shared
    let limiteMinimo = 0.01
    var body: some View {
        VStack {
            Slider(
                value: $inputs.percentualDeSubstituicao,
                in: limiteMinimo...1,
                onEditingChanged: { editing in
                    // Nenhuma ação necessária aqui
                }
            ).padding(.vertical)
                .accentColor(sliderBackgroundColor())

            
            Text("Substituição de \(String(format: "%.2f",  inputs.percentualDeSubstituicao * 100))% de água potável por água pluvial")
                .font(.caption)
                .padding(.bottom)
                .foregroundStyle(Color.gray)
            
            Divider()
            
            if inputs.percentualDeSubstituicao >= 0.3 && inputs.percentualDeSubstituicao <= 0.4 {
                Text("Essa substituição é recomendada para o perfil de sua residência.")
                    .padding(.vertical)
                    .font(.caption)
            } else if inputs.percentualDeSubstituicao >= 0.25 && inputs.percentualDeSubstituicao <= 0.35 {
                Text("Essa substituição pode ser usada para o perfil de sua residência.")
                    .padding(.vertical)
                    .font(.caption)
            } else {
                Text("Essa substituição nao é recomendada para o perfil de sua residência.")
                    .padding(.vertical)
                    .font(.caption)
            }
            
        }
    }
    
    private func sliderBackgroundColor() -> Color {
        let sliderValue = inputs.percentualDeSubstituicao
        if sliderValue >= 0.3 && sliderValue <= 0.4 {
            return Color.green
        } else if sliderValue >= 0.25 && sliderValue <= 0.45 {
            return Color.yellow
        } else {
            return Color.red
        }
    }
    
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSliderView()
    }
}
