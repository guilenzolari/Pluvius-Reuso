//
//  OnboardingContent.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 29/05/24.
//

import Foundation

let onboardingContent: [Onboarding] = [
    Onboarding(titulo: "Qual a finalidade desse APP?",
               texto: "O propósito desse aplicativo é avaliar os custos e a viabilidade da implementação de sistemas de reutilização de água pluvial em unidades residenciais na cidade de Campinas.",
               image: "dollarsign.circle",
               color: .yellow,
               mostrarBotaoComecar: false),
    Onboarding(titulo: "Qual o uso da água tratada?",
               texto: "A água coletada será direcionada para usos secundários, excluindo o consumo humano, tais como lavagem de calçadas, descargas e irrigação de plantas.",
               image: "drop",
               color: .blue,
               mostrarBotaoComecar: false),
    Onboarding(titulo: "E se eu não souber sobre processos químicos?",
               texto: "O aplicativo oferece uma descrição detalhada do processo de reaproveitamento da água da chuva, fornecendo informações educacionais aos usuários para uma compreensão abrangente do tema.",
               image: "book.fill",
               color: .red,
               mostrarBotaoComecar: false),
    Onboarding(titulo: "Pra que serve esse APP?",
               texto: "O intuito é fomentar a conscientização sobre práticas sustentáveis de uso da água e seus impactos benéficos no meio ambiente, incentivando a adoção do reaproveitamento de água pluvial como uma ação sustentável e socialmente responsável.",
               image: "leaf",
               color: .green,
               mostrarBotaoComecar: true)
]
