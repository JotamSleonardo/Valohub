//
//  Agent.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 11/2/24.
//

struct Agent: Codable, Equatable, Identifiable {
    let id: String
    let name: String
    let description: String
    let fullPicture: String
    let backgroundColors: [String]
    let role: Role
    let abilities: [Ability]

    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name = "displayName"
        case description
        case fullPicture = "fullPortraitV2"
        case backgroundColors = "backgroundGradientColors"
        case role
        case abilities = "abilities"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.fullPicture = try container.decode(String.self, forKey: .fullPicture)
        self.backgroundColors = try container.decode([String].self, forKey: .backgroundColors)
        self.role = try container.decode(Role.self, forKey: .role)
        self.description = try container.decode(String.self, forKey: .description)
        self.abilities = try container.decode([Ability].self, forKey: .abilities)
    }
}

struct Role: Codable, Equatable {
    let id: String
    let name: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name = "displayName"
        case description
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
    }
}

struct Ability: Codable, Equatable {
    let name: String
    let icon: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case name = "displayName"
        case icon = "displayIcon"
        case description
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon) ?? ""
        self.description = try container.decode(String.self, forKey: .description)
    }
}
