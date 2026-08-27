import StorageDomain
import SwiftUI

struct StorageView: View {
    let room: StorageRoom

    var body: some View {
        StorageMapLayout(room: room) {
            ForEach(room.modules) { module in
                ModuleView(module: module)
            }
        }
        .background {
            StorageGridBackground(rows: room.gridRows, cols: room.gridCols)
        }
        .background {
            Color.green
        }
        .padding()
    }
}

struct StorageGridBackground: View {
    let rows: Int
    let cols: Int

    var body: some View {
        GeometryReader { proxy in
            let cellPointSize = proxy.size.width / CGFloat(cols)

            Canvas { context, size in
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
        }
    }
}

struct ModuleView: View {
    let module: Module

    var body: some View {
        Rectangle()
            .fill(.blue)
            .border(.black)
            .overlay {
                Text(module.description)
            }
    }
}

#Preview {
    StorageView(room: .mock)
}
