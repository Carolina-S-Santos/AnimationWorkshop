//
//  ProgressIndicator.swift
//  AnimationWorkshop
//
//  Created by Carolina Silva dos Santos on 23/10/25.
//

import SwiftUI

// MARK: - 3) Progress Indicator: Color + Size Transition
struct ProgressIndicator: View {
    enum Phase: CaseIterable { case small, medium, large }

    var body: some View {
        PhaseAnimator(Phase.allCases) { phase in
            Capsule()
                .fill(color(for: phase))
                .frame(width: size(for: phase), height: 18)
        
        } animation: { _ in
            .easeInOut(duration: 0.6)
        }
        .frame(width: 150, height: 150)
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
    }

    func color(for phase: Phase) -> Color {
        switch phase {
        case .small: .gray
        case .medium: .blue
        case .large: .green
        }
    }
    func size(for phase: Phase) -> CGFloat {
        switch phase {
        case .small: 80
        case .medium: 120
        case .large: 160
        }
    }
}

#Preview {
    ProgressIndicator()
}
