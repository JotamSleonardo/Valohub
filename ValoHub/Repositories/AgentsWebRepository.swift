//
//  AgentsWebRepository.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 10/29/24.
//

import Foundation
import Combine

protocol AgentsWebRepository: WebRepository {
    func loadAgents() -> AnyPublisher<Response<Agent>, Error>
}

struct RealAgentsWebRepository: AgentsWebRepository {
    let session: URLSession
    let baseURL: String
    let bgQueue = DispatchQueue(label: "bg_parse_queue")

    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }

    func loadAgents() -> AnyPublisher<Response<Agent>, any Error> {
        return self.call(endpoint: Api.allAgents)
    }

}

extension RealAgentsWebRepository {
    enum Api {
        case allAgents
    }
}

extension RealAgentsWebRepository.Api: APICall {
    var path: String {
        return "/v1/agents"
    }
    
    var method: String {
        return "Get"
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/json"]
    }
    
    var parameters: [URLQueryItem]? {
        return [
            URLQueryItem(name: "isPlayableCharacter", value: "true")
        ]
    }
    
    func body() throws -> Data? {
        return nil
    }
}
