//
//  AgentsInteractor.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 11/2/24.
//

import SwiftUI
import Combine

protocol AgentsInteractor {
    func loadAgents(agents: Binding<[Agent]>)
}

struct RealAgentsInteractor: AgentsInteractor {
    private let cancelBag = CancelBag()

    let agentsWebRepository: RealAgentsWebRepository

    init(agentsWebRepository: RealAgentsWebRepository) {
        self.agentsWebRepository = agentsWebRepository
    }

    func loadAgents(agents: Binding<[Agent]>) {
        self.agentsWebRepository
            .loadAgents()
            .sink(
                receiveCompletion: { completions in
                    // Handle errors in the future
                    print(completions)
                },
                receiveValue: { response in
                    agents.wrappedValue = response.data
                }
            )
            .store(in: cancelBag)
    }
}

struct stubAgentsInteractor: AgentsInteractor {
    func loadAgents(agents: Binding<[Agent]>) {}
}
