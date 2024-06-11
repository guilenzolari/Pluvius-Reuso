//
//  View+GetSize.swift
//  TCC
//
//  Created by Guilherme Ferreira Lenzolari on 22/05/24.
//

import Foundation
import SwiftUI

extension View {
    func getWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    func getHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
}
