import SwiftUI

struct StorageGridBackground: View {
    let rows: Int
    let cols: Int
    let backgroundColor: Color
    let cornerRadius: CGFloat

    var body: some View {
        GeometryReader { proxy in
            let cellPointSize = proxy.size.width / CGFloat(cols)

            Canvas { context, size in
                context.stroke(
                    Path {
                        $0.addRoundedRect(
                            in: .init(
                                x: 0, y: 0,
                                width: size.width, height: size.height
                            ),
                            cornerSize: .init(width: cornerRadius, height: cornerRadius)
                        )
                    },
                    with: .color(.gray),
                    lineWidth: 4
                )

                for row in 0...rows {
                    let y = CGFloat(row) * cellPointSize
                    context.stroke(
                        Path {
                            $0.move(to: .init(x: 0, y: y))
                            $0.addLine(to: .init(x: size.width, y: y))
                        },
                        with: .color(.black.opacity(0.3))
                    )
                }

                for col in 0...cols {
                    let x = CGFloat(col) * cellPointSize
                    context.stroke(
                        Path {
                            $0.move(to: .init(x: x, y: 0))
                            $0.addLine(to: .init(x: x, y: size.height))
                        },
                        with: .color(.black.opacity(0.3))
                    )
                }
            }
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .shadow(color: .gray, radius: 4, x: 0, y: 4)
        }
    }
}

#Preview {
    StorageGridBackground(
        rows: 7,
        cols: 4,
        backgroundColor: .white,
        cornerRadius: 20
    )
}
