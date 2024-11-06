//
//  InteractorsContainer.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 11/2/24.
//

extension DIContainer {
    struct Interactors {
        let agentsInteractor: AgentsInteractor

        init(agentsInteractor: AgentsInteractor) {
            self.agentsInteractor = agentsInteractor
        }

        static var stub: Self {
            .init(agentsInteractor: stubAgentsInteractor())
        }
    }
}
