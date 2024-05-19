import SwiftUI
import Charts

struct InformacoesView: View {
    @Binding var selectedTab: Int
    @StateObject var dadosVolume = CalculoVolumeReservatorio()
    
    var body: some View {
        
        Chart {
            ForEach(dadosVolume.mesesDoAno.indices, id: \.self) { index in
                BarMark(
                    x: .value("Mês", dadosVolume.mesesDoAno[index]),
                    y: .value("Precipitação (mm)", dadosVolume.mediaMensalPrecipitacao[index])
                )
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}
