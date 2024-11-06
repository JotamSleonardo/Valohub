//
//  AgentCard.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 11/3/24.
//

import SwiftUI

struct AgentCard: View {
    let name: String
    let imageUrl: String
    let role: String
    let backgroundColor: Color

    var body: some View {
        let startColor = backgroundColor
        let endColor = startColor.darker(by: 60)
        let imageName = name.contains("KAY/O") ? "KAYO" : name

        ZStack {
            AgentCardShape()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [startColor, endColor]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .padding(.top, 70)

            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 150)
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: HorizontalAlignment.leading) {
                        Text(name)
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .padding(.leading, 15)
                            .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 2)
                        Text(role)
                            .foregroundColor(.white)
                            .font(.caption)
                            .padding(.leading, 15)
                            .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 2)
                    }

                    Spacer()
                }
                .padding(.bottom, 15)
            }

        }
    }
}

#Preview {
    AgentCard(
        name: "Raze",
        imageUrl: "https://media.valorant-api.com/agents/f94c3b30-42be-e959-889c-5aa313dba261/fullportrait.png",
        role: "Duelist",
        backgroundColor: .black
    )
}
