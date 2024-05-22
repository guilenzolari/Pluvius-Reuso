//
//  OnboardingView.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 21/05/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentTab = 0
    
    var body: some View {
        TabView(selection: $currentTab) {
            Onboarding1()
                .tag(0)
            Onborading2()
                .tag(1)
            Onboarding3()
                .tag(2)
            Onboarding4()
                .tag(3)
            
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnboardingView()
}
