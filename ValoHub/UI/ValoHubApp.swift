//
//  ValoHubApp.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 10/10/24.
//

import SwiftUI

@main
struct ValoHubApp: App {
    @State private var isLandingPage: Bool = true

    var body: some Scene {
        WindowGroup {
            let DIContainer = AppEnvironment
                .setUpEnvironment()
                .container

            switch isLandingPage {
                case true:
                    LandingPage(isLandingPage: $isLandingPage)
                case false:
                    AgentList()
                        .inject(DIContainer)
            }
        }
    }
}
