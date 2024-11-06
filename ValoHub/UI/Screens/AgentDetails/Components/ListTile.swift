//
//  ListTile.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 11/5/24.
//

import SwiftUI

struct ListTile: View {
    let name: String
    let icon: String
    let description: String

    var body: some View {
        ZStack {
            HStack {
                AsyncImage(url: URL(string: icon)) { image in
                    image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(.all, 5)
                        .background(RoundedRectangle(8).fill(Constants.iconBackgroundColor))
                } placeholder: {
                    ProgressView()
                        .scaleEffect(2.0)
                }
                VStack(alignment: .leading) {
                    Text(name)
                        .textCase(.uppercase)
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 2)
                    Text(self.secondSentence(from: description))
                        .foregroundColor(.cgLightGray)
                        .font(.subheadline)
                        .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 2)
                }
                .padding(.leading, 10)
                Spacer()

            }
            .padding(.all, 7)
        }
        .background(RoundedRectangle(8).fill(Constants.tileBackgroundColor))
    }

    func secondSentence(from text: String) -> String {
        let sentences = text.components(separatedBy: ". ")

        if sentences.count > 1 {
            // Split the second sentence into words
            let words = sentences[1].split(separator: " ")

            // Ensure there are more than two words
            if words.count > 2 {
                // Join words starting from the third word onward
                let modifiedSentence = words.dropFirst(2).joined(separator: " ")

                // Capitalize the first letter
                return modifiedSentence.prefix(1).uppercased() + modifiedSentence.dropFirst()
            } else {
                return sentences[1].capitalized // If fewer than two words, return the capitalized second sentence
            }
        } else {
            return text
        }
    }
}

#Preview {
    ListTile(name: "dash", icon: "https://media.valorant-api.com/agents/add6443a-41bd-e414-f6ad-e58d267f4e95/abilities/ability1/displayicon.png", description: "jotam malupit")
}
