//
//  Example.swift
//  AnimationWorkshop
//
//  Created by Carolina Silva dos Santos on 22/10/25.
//

import SwiftUI
import Lottie

struct Example: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isError = false
    @State private var showSuccess = false
    let successAnimationName = "Approve"
    let confettiAnimationName = "confetti"
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Welcome")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .padding(20)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Email:")
                        .font(.body.bold())
                    
                    PhaseAnimator([false, true, false], trigger: isError) { phase in
                        TextField("Enter your email", text: $email)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white)
                                    .stroke(phase ? .red : .gray.opacity(0.3), lineWidth: phase ? 3 : 1.5)
                            )
                            .scaleEffect(phase ? 1.03 : 1.0)
                    } animation: { _ in
                        .easeInOut(duration: 0.6)
                    }
                    .padding(.bottom, 10)
                    
                    Text("Password:")
                        .font(.body.bold())
                    
                    PhaseAnimator([false, true, false], trigger: isError) { phase in
                        SecureField("Enter your password", text: $password)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white)
                                    .stroke(phase ? .red : .gray.opacity(0.3), lineWidth: phase ? 3 : 1.5)
                            )
                            .scaleEffect(phase ? 1.03 : 1.0)
                    } animation: { _ in
                        .easeInOut(duration: 0.6)
                    }
                }
                
                Spacer()
                
                if showSuccess {
                    HStack {
                        Spacer()
                        LottieView(animation: .named(successAnimationName))
                            .configure { $0.contentMode = .scaleAspectFit }
                            .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                            .animationSpeed(2.0)
                            .animationDidFinish { completed in
                                if completed {
                                    
                                }
                            }
                            .frame(width: 200, height: 200)
                        Spacer()
                    }
                }
                
                Spacer()
                
                PhaseAnimator([false, true, false], trigger: isError) { phase in
                    Button {
                        let emailEmpty = email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                        let passwordEmpty = password.isEmpty
                        if emailEmpty || passwordEmpty {
                            showSuccess = false
                            isError.toggle()
                        } else {
                            showSuccess = true
                        }
                    } label: {
                        Text("Register")
                            .font(.title3.bold())
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(phase ? .red : .blue)
                            .cornerRadius(16)
                    }
                    .rotationEffect(.degrees(phase ? 360 : 0))
                } animation: { _ in
                    .easeInOut(duration: 0.6)
                }
            }
            .padding()
            
            if showSuccess {
                LottieView {
                    try await DotLottieFile.named(confettiAnimationName, bundle: .main)
                }
                .configure { $0.contentMode = .scaleAspectFit }
                .animationSpeed(1.5)
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
            }
        }
    }
}

#Preview {
    Example()
}
