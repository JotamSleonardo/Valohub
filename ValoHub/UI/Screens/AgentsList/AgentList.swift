//
//  AgentList.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 11/2/24.
//

import SwiftUI

struct AgentList: View {
    @Environment(\.injected) private var injected: DIContainer
    @State private var agents: [Agent] = []
    @State private var searchText = ""

    let columns = Array(
        repeating: GridItem(.flexible()),
        count: 2
    )

    var body: some View {
        NavigationView {
            ZStack {
                Constants.backgroundColor
                    .ignoresSafeArea()

                VStack {
                    /// Navigation Bar view
                    HStack {
                        Image("Valogo")
                            .resizable()
                            .frame(width: 40, height: 30)
                            .padding(.leading, 25)
                        Spacer()
                        Image("user")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 2)
                            )
                            .padding(.trailing, 25)
                    }

                    HStack {
                        Text("Learn Your \nFavorite Agents")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .heavy, design: .default))
                            .padding(.horizontal, 25)
                            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 2)
                        Spacer()
                    }.padding(.top, 15)
                    SearchBar(searchText: $searchText)
                        .padding(.top, 25)
                    Spacer()
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(agents) { agent in
                                let backgroundColor = Color(
                                    hex: agent.backgroundColors.first ?? ""
                                )
                                NavigationLink {
                                    AgentDetails(
                                        agentName: agent.name,
                                        role: agent.role.name,
                                        biography: agent.description,
                                        backgroundColor: backgroundColor,
                                        abilities: agent.abilities
                                    )
                                } label: {
                                    AgentCard(
                                        name: agent.name,
                                        imageUrl: agent.fullPicture,
                                        role: agent.role.name,
                                        backgroundColor: backgroundColor
                                    )
                                    .frame(height: 300)
                                }


                            }
                        }
                        .padding(.top, 15)
                        .padding(.horizontal, 15)
                    }.onAppear {
                        self.injected
                            .interactors
                            .agentsInteractor
                            .loadAgents(agents: $agents)
                    }
                }
            }
        }

    }
}

#Preview {
    AgentList()
}
