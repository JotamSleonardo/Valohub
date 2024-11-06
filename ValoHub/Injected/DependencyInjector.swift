//
//  DIContainer.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 10/29/24.
//

import SwiftUI
import Combine

struct DIContainer: EnvironmentKey {
    static var defaultValue: Self { Self.default }

    let interactors: Interactors

    init(interactors: Interactors) {
        self.interactors = interactors
    }

    private static let `default` = Self(interactors: .stub)
}

extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}

extension View {
    func inject(_ container: DIContainer) -> some View {
        return self
            .environment(\.injected, container)
    }
}
