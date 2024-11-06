//
//  LandingPage.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 11/2/24.
//

import SwiftUI

struct LandingPage: View {
    @Binding public var isLandingPage: Bool

    var body: some View {
        ZStack {
            Color
                .black.opacity(0.9)
                .ignoresSafeArea()

            GeometryReader { geometry in
                Image("sage_full_image")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.6)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .padding(.top, 250)
                    .padding(.leading, 50)
            }
            .ignoresSafeArea()

            VStack {
                Image("Valogo")
                    .resizable()
                    .frame(width: 60, height: 50)
                Spacer()
                HStack {
                    Text("We are \nvalorant")
                        .textCase(.uppercase)
                        .foregroundStyle(.white)
                        .font(.system(size: 55, weight: .heavy, design: .default))
                        .padding(.horizontal, 25)
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 2)
                    Spacer()
                }

                Button(action: {
                    self.isLandingPage = false
                }) {
                    Text("Browse Agents")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .clipShape(CutCornerShape(cutSize: 20))
                        .overlay(
                            CutCornerShape(cutSize: 20)
                                .stroke(Color.white, lineWidth: 3)
                        )
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 40)
            }
        }
    }
}

//#Preview {
//    LandingPage(isLandingPage: )
//}
