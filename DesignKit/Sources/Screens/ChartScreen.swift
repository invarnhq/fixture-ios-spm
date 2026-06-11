import Numerics
import SwiftUI

/// Bar chart screen. Bar heights come from a fixed exponential-decay series
/// computed with swift-numerics, so the external dependency is genuinely
/// exercised at compile and render time while staying deterministic.
public struct ChartScreen: View {
    public init() {}

    private var bars: [Double] {
        (0..<7).map { index in
            Double.exp(-Double(index) / 4.0)
        }
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Weekly activity")
                    .font(.system(size: 28, weight: .semibold))
                Text("Build minutes, last seven days.")
                    .font(.system(size: 15))
                    .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.45))
            }

            HStack(alignment: .bottom, spacing: 12) {
                ForEach(Array(bars.enumerated()), id: \.offset) { _, value in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(red: 0.0, green: 0.44, blue: 0.89))
                        .frame(height: 220 * value)
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(height: 220, alignment: .bottom)

            Spacer()
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.white)
    }
}
