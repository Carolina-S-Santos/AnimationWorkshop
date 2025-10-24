//
//  AnimatedButton.swift
//  AnimationWorkshop
//
//  Created by Carolina Silva dos Santos on 23/10/25.
//

import SwiftUI

// MARK: - 2) Button: Expand → Rotate → Shrink
struct AnimatedButton: View {
    enum Phase: CaseIterable { case small, expanded, rotated }

    var body: some View {
        PhaseAnimator(Phase.allCases) { phase in
            Button(action: {}) {
                Text("Tap Me")
                    .padding(24)
                    .font(.headline.bold())
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                    .rotationEffect(rotation(for: phase))
                    .scaleEffect(scale(for: phase))
            }
        } animation: { _ in
            .easeInOut(duration: 0.5)
        }
        .frame(width: 150, height: 150)
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
    }

    func scale(for phase: Phase) -> CGFloat {
        switch phase {
        case .small: 1.0
        case .expanded: 1.2
        case .rotated: 1.0
        }
    }
    func rotation(for phase: Phase) -> Angle {
        switch phase {
        case .rotated: .degrees(10)
        default: .degrees(0)
        }
    }
}

#Preview {
    AnimatedButton()
}
