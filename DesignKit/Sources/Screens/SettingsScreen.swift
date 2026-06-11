import SwiftUI

/// Settings screen: static rows with fixed on/off states. Built from plain
/// layout primitives so it renders identically on iOS and macOS.
public struct SettingsScreen: View {
    public init() {}

    private let rows: [(label: String, enabled: Bool)] = [
        ("Notifications", true),
        ("Weekly digest", true),
        ("Sound effects", false),
        ("Auto-update", true),
    ]

    public var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Settings")
                .font(.system(size: 28, weight: .semibold))

            VStack(spacing: 0) {
                ForEach(Array(rows.enumerated()), id: \.offset) { index, row in
                    HStack {
                        Text(row.label)
                            .font(.system(size: 17))
                        Spacer()
                        Capsule()
                            .fill(
                                row.enabled
                                    ? Color(red: 0.2, green: 0.78, blue: 0.35)
                                    : Color(red: 0.82, green: 0.82, blue: 0.84)
                            )
                            .frame(width: 51, height: 31)
                            .overlay(
                                Circle()
                                    .fill(Color.white)
                                    .padding(2)
                                    .frame(maxWidth: .infinity, alignment: row.enabled ? .trailing : .leading)
                            )
                    }
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)

                    if index < rows.count - 1 {
                        Divider().padding(.leading, 16)
                    }
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.97))
            )

            Spacer()
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.white)
    }
}
