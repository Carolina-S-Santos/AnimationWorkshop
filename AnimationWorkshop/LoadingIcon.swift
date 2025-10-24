//
//  LoadingIcon.swift
//  AnimationWorkshop
//
//  Created by Carolina Silva dos Santos on 23/10/25.
//

import SwiftUI

// MARK: - 4) Loading Loop: Pulsating Rotating Icon
struct LoadingIcon: View {
    enum Phase: CaseIterable { case small, large }

    var body: some View {
        PhaseAnimator(Phase.allCases) { phase in
            Image(systemName: "arrow.triangle.2.circlepath")
                .font(.system(size: 64))
                .foregroundStyle(.teal)
                .rotationEffect(.degrees(rotation(for: phase)))
                .scaleEffect(scale(for: phase))
        } animation: { _ in
            .easeInOut(duration: 0.8)
        }
        .frame(width: 150, height: 150)
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
    }

    func rotation(for phase: Phase) -> Double { phase == .large ? 360 : 0 }
    func scale(for phase: Phase) -> CGFloat { phase == .large ? 1.2 : 0.9 }
}

#Preview {
    LoadingIcon()
}
