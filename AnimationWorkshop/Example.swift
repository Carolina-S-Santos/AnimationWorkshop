//
//  Example.swift
//  AnimationWorkshop
//
//  Created by Carolina Silva dos Santos on 22/10/25.
//

import SwiftUI

struct Example: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isError = false
    @State private var showSuccess = false
    @State private var rotation: Double = 0
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
                    
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                            .stroke(.gray.opacity(0.3), lineWidth: 1.5)
                        )
                        .padding(.bottom, 10)
                    
                    Text("Password:")
                        .font(.body.bold())
                    
                    SecureField("Enter your password", text: $password)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                            .stroke(.gray.opacity(0.3), lineWidth: 1.5)
                        )
                }
                
                Spacer()
                
                Button {
                    let emailEmpty = email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    let passwordEmpty = password.isEmpty
                    if emailEmpty || passwordEmpty {
                        showSuccess = false
                        withAnimation(.bouncy(duration: 0.6)) {
                            isError = true
                            rotation += 360
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                            isError = false
                        }
                    } else {
                        isError = false
                        showSuccess = true
                    }
                } label: {
                    Text("Register")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                        .cornerRadius(16)
                }
            }
            .padding()
        }
    }
}

#Preview {
    Example()
}
