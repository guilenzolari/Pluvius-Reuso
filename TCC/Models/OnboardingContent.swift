//
//  OnboardingContent.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 29/05/24.
//

import Foundation

let onboardingContent: [Onboarding] = [
    Onboarding(titulo: "Bem-vindo ao app de Pluvius Reuso!",
               texto: "Nosso aplicativo ajuda você a estimar os custos e a analisar a viabilidade de implementar sistemas de reutilização de água da chuva em sua residência em Campinas.",
               image: "dollarsign.circle",
               color: .yellow,
               mostrarBotaoComecar: false),
    Onboarding(titulo: "Como a água coletada é utilizada?",
               texto: "A água coletada será usada para fins não potáveis, como lavagem de calçadas, descargas e irrigação de plantas, promovendo sustentabilidade em sua casa.",
               image: "drop",
               color: .blue,
               mostrarBotaoComecar: false),
    Onboarding(titulo: "Aprenda sobre o processo",
               texto: "Nosso aplicativo oferece uma descrição detalhada do processo de reaproveitamento da água da chuva, proporcionando a você uma compreensão completa e educativa.",
               image: "book",
               color: .red,
               mostrarBotaoComecar: false),
    Onboarding(titulo: "Por que reutilizar água é importante?",
               texto: "Descubra como práticas sustentáveis de uso da água beneficiam o meio ambiente e como você pode adotar a reutilização da água pluvial de maneira responsável e consciente.",
               image: "leaf",
               color: .green,
               mostrarBotaoComecar: true)
]
