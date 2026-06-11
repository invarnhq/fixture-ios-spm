import SwiftUI

/// Landing screen: greeting header plus a fixed grid of feature cards.
/// Deterministic by construction — no dates, no randomness, no system state.
public struct HomeScreen: View {
    public init() {}

    private let cards: [(title: String, subtitle: String)] = [
        ("Projects", "4 active"),
        ("Reviews", "2 waiting"),
        ("Releases", "1 scheduled"),
        ("Alerts", "None"),
    ]

    public var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Welcome back")
                    .font(.system(size: 28, weight: .semibold))
                Text("Here is what changed while you were away.")
                    .font(.system(size: 15))
                    .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.45))
            }

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(cards, id: \.title) { card in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(card.title)
                            .font(.system(size: 17, weight: .semibold))
                        Text(card.subtitle)
                            .font(.system(size: 13))
                            .foregroundColor(Color(red: 0.43, green: 0.43, blue: 0.45))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(red: 0.96, green: 0.96, blue: 0.97))
                    )
                }
            }

            Spacer()
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.white)
    }
}
