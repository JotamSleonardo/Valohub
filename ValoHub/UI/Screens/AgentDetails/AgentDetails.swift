//
//  AgentDetails.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 11/3/24.
//

import SwiftUI

struct AgentDetails: View {
    let agentName: String
    let role: String
    let biography: String
    let backgroundColor: Color
    let abilities: [Ability]

    var body: some View {
        let startColor = backgroundColor
        let endColor = startColor.darker(by: 100)
        let imageName = agentName.contains("KAY/O") ? "KAYO" : agentName

        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [startColor, endColor]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .ignoresSafeArea()
            VStack {
                ZStack {
                    HStack {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 600)
                            .padding(.top, -100)
                            .padding(.leading, 30)
                            .opacity(0.1)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 550)
                            .padding(.top, -80)
                            .padding(.trailing, 40)
                    }
                }
                Spacer()
            }
            VStack {
                HStack() {
                    VStack(alignment: .leading) {
                        Text(agentName)
                            .padding(.top, 120)
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.heavy)
                            .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 2)

                        Text(role)
                            .padding(.vertical, 7)
                            .padding(.horizontal, 10)
                            .background(
                                RoundedRectangle(10)
                                    .fill(Constants.cardBackgroundColor.opacity(0.7))
                            )
                            .padding(.top, -10)
                            .foregroundColor(.white)
                            .font(.headline)
                    }.padding(.leading, 25)

                    Spacer()
                }
                
                Spacer()
            }
            ZStack {
                Color.clear
                ScrollView {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("// Biography")
                                .textCase(.uppercase)
                                .foregroundColor(.white)
                                .font(.title3)
                                .fontWeight(.heavy)
                                .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 2)
                            Text(biography)
                                .padding(.top, 5)
                                .foregroundColor(.cgLightGray)
                                .font(.headline)
                                .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 2)

                            Text("// Special abilities")
                                .textCase(.uppercase)
                                .foregroundColor(.white)
                                .font(.title3)
                                .fontWeight(.heavy)
                                .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 2)
                                .padding(.top, 15)
                            ForEach(abilities, id: \.name) { ability in
                                ListTile(
                                    name: ability.name,
                                    icon: ability.icon,
                                    description: ability.description
                                )
                                    .padding(.top, 5)
                            }



                            Spacer()
                        }
                        Spacer()
                    }.padding(.all, 30)
                }

            }
                .background(
                    RoundedRectangle(20)
                        .fill(Constants.backgroundColor)
                )
                .padding(.top, 350)
                .ignoresSafeArea()

        }
    }
}

#Preview {
    AgentDetails(
        agentName: "Jett",
        role: "Controller",
        biography: """
        Representing her home country of South Korea, Jett's agile and evasive fighting style lets her take risks no one else can. She runs circles around every skirmish, cutting enemies up before they even know what hit them.
        """,
        backgroundColor: Color(hex: "90e3fdff"),
        abilities: []
    )
}
