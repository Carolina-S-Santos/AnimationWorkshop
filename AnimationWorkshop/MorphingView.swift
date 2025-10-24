//
//  MorphingView.swift
//  AnimationWorkshop
//
//  Created by Carolina Silva dos Santos on 23/10/25.
//

import SwiftUI

// MARK: - 5) View Transition: Morph Square ↔ Circle
struct MorphingView: View {
    enum Phase: CaseIterable { case square, circle }

    var body: some View {
        PhaseAnimator(Phase.allCases) { phase in
            RoundedRectangle(cornerRadius: corner(for: phase))
                .fill(color(for: phase))
                .frame(width: 110, height: 110)
                .rotationEffect(rotation(for: phase))
        } animation: { _ in
            .easeInOut(duration: 1.0)
        }
        .frame(width: 150, height: 150)
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
    }

    func corner(for phase: Phase) -> CGFloat { phase == .circle ? 55 : 0 }
    func rotation(for phase: Phase) -> Angle { phase == .circle ? .degrees(45) : .degrees(0) }
    func color(for phase: Phase) -> Color { phase == .circle ? .orange : .purple }
}

#Preview {
    MorphingView()
}
