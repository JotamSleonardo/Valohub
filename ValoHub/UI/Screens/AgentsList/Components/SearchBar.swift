//
//  SearchBar.swift
//  ValoHub
//
//  Created by Jotam Leonardo on 11/2/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)
            TextField("Search...", text: $searchText)
                .padding(10)
                .background(Color.clear)
        }
        .background(CutCornerShape(cutSize: 20).fill(Color.white))
        .overlay(
            CutCornerShape(cutSize: 20)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .padding(.horizontal, 25)
    }
}

