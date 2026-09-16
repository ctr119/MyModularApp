import Foundation
import SwiftUI

extension View {
    func stackedAlerts(_ alerts: Binding<[AlertItem]>) -> some View {
        self.overlay(alignment: .bottom) {
            AlertStackView(alertItems: alerts)
        }
    }
}
