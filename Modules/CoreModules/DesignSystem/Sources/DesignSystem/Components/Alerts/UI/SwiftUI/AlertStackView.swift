import Foundation
import SwiftUI

struct AlertStackView: View {
    @State private var offset: CGSize = .zero
    
    @Binding var alertItems: [AlertItem]
    
    var body: some View {
        ZStack {
            ForEach(alertItems.indices, id: \.self) { index in
                let yPosition: CGFloat = index == alertItems.count - 1 ? 0 : index == alertItems.count - 2 ? 12 : 24
                let scaleFactor: CGFloat = index == alertItems.count - 1 ? 1 : index == alertItems.count - 2 ? 0.95 : 0.9
                
                AlertTileView(
                    alert: alertItems[index],
                    dismissTile: {
                        _ = withAnimation(.easeInOut) {
                            self.alertItems.removeLast()
                        }
                    }
                )
                    .scaleEffect(x: scaleFactor, y: scaleFactor, anchor: .center)
                    .animation(.bouncy(duration: 0.4, extraBounce: 0.3), value: alertItems)
                    .offset(
                        x: index == alertItems.count - 1 ? offset.width : 0,
                        y: yPosition
                    )
                    .gesture(
                        index == alertItems.count - 1 ? DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                            }
                            .onEnded { _ in
                                if abs(offset.width) > 100 {
                                    // Swipe off screen
                                    withAnimation {
                                        offset.width = offset.width > 0 ? 500 : -500
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            alertItems.removeLast()
                                            offset = .zero
                                        }
                                    }
                                } else {
                                    // Reset position
                                    withAnimation(.spring()) {
                                        offset = .zero
                                    }
                                }
                            } : nil
                    )
                    .zIndex(Double(index))
            }
        }
    }
}

#if DEBUG
#Preview {
    
    @Previewable
    @State
    var alerts: [AlertItem] = [
        .info(
            message: "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            action: .dismiss()
        ),
        .info(
            message: "2. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            action: .retry({})
        ),
        .warning(
            message: "3. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            action: .retry({})
        ),
        .warning(
            message: "4. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            action: .retry({})
        ),
        .error(
            message: "5. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            action: .report({})
        ),
        .error(
            message: "6. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            action: .dismiss()
        ),
    ]
    
    ThemedPreview(
        theme: .dark,
        content: {
            AlertStackView(alertItems: $alerts)
        }
    )
}
#endif
