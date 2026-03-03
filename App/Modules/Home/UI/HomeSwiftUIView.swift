//
//  SwiftUIView.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/3/2.
//

import SwiftUI

struct HomeSwiftUIView: View {

    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)

            Text("Hello, \(viewModel.username)")
        }
        .onAppear {
            viewModel.load()
        }
    }
}
