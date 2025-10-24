//
//  BellAnimation.swift
//  AnimationWorkshop
//
//  Created by Carolina Silva dos Santos on 23/10/25.
//

import SwiftUI

// MARK: - 1) Bell Animation Phases
struct BellAnimationView: View {
    enum BellPhase: CaseIterable {
        case small
        case tiltedLeft
        case tiltedRight
    }

    var body: some View {
        PhaseAnimator(BellPhase.allCases) { phase in
            Image(systemName: "bell.fill")
                .font(.system(size: 80))
                .foregroundStyle(color(for: phase))
                .rotationEffect(angle(for: phase))
                .scaleEffect(scale(for: phase))
                .shadow(radius: 10)
        } animation: { phase in
            switch phase {
            case .small: .spring(response: 0.4, dampingFraction: 0.6)
            case .tiltedLeft, .tiltedRight: .easeInOut(duration: 0.3)
            }
        }
        .frame(width: 150, height: 150)
        .padding()
    }

    // MARK: - Phase States
    func angle(for phase: BellPhase) -> Angle {
        switch phase {
        case .small: return .degrees(0)
        case .tiltedLeft: return .degrees(-20)
        case .tiltedRight: return .degrees(20)
        }
    }

    func scale(for phase: BellPhase) -> CGFloat {
        switch phase {
        case .small: return 0.95
        case .tiltedLeft, .tiltedRight: return 1.0
        }
    }

    func color(for phase: BellPhase) -> Color {
        switch phase {
        case .small: return .yellow
        case .tiltedLeft: return .orange
        case .tiltedRight: return .yellow
        }
    }
}

#Preview {
    BellAnimationView()
}
