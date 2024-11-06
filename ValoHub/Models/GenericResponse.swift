//
//  GenericResponse.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 11/3/24.
//

import Foundation

struct Response<T: Codable>: Codable {
    let data: [T]

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([T].self, forKey: .data)
    }
}
