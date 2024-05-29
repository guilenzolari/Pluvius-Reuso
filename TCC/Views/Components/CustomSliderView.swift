import SwiftUI

struct CustomSliderView: View {
    @ObservedObject var inputs = InserirDadosViewModel.shared

    var body: some View {
        VStack {
            Slider(
                value: $inputs.percentualDeSubstituicao,
                in: 0...1,
                onEditingChanged: { editing in
                    // Nenhuma ação necessária aqui
                }
            )
            .accentColor(Color.clear)
            .background(
                sliderBackgroundColor()
            )
            .cornerRadius(8.0)
            .opacity(0.7)
            
            
            Text("Substituição de \(String(format: "%.2f",  inputs.percentualDeSubstituicao * 100))% de água potável por água pluvial")
                .font(.caption2)

        }
    }
    
    private func sliderBackgroundColor() -> Color {
        let sliderValue = inputs.percentualDeSubstituicao
        if sliderValue >= 0.2 && sliderValue <= 0.3 {
            return Color.green
        } else if sliderValue >= 0.15 && sliderValue <= 0.4 {
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
