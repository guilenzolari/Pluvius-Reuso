import SwiftUI
import Charts

struct InformacoesView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationView {
            VStack {
                Text("AAA")
            }.navigationTitle(Text("Informações"))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
