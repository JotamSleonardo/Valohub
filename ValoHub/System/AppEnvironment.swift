//
//  AppEnvironment.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 10/29/24.
//

import Foundation


struct AppEnvironment {
    let container: DIContainer

    static func setUpEnvironment() -> AppEnvironment {
        let session = configuredURLSession()
        let agentsWebRepository = RealAgentsWebRepository(
            session: session,
            baseURL: "https://valorant-api.com"
        )

        let diContainer = DIContainer(
            interactors: self.configuredInteractors(
                agentsWebRepository: agentsWebRepository
            )
        )

        return AppEnvironment(container: diContainer)
    }

    private static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = .shared

        return URLSession(configuration: configuration)
    }

    private static func configuredInteractors(agentsWebRepository: RealAgentsWebRepository) -> DIContainer.Interactors {
        let agentsInteractor = RealAgentsInteractor(agentsWebRepository: agentsWebRepository)

        return .init(agentsInteractor: agentsInteractor)
    }
}
