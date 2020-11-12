//
//  ContentView.swift
//  Demo
//
//  Created by Yuto Akiba on 2020/11/13.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        HStack {
            Button(viewModel: viewModel, action: .decrease) {
                Text("-")
            }
            .font(Font.system(size: 80, weight: .regular))
            TextField("", value: $viewModel.state.number, formatter: NumberFormatter())
                .multilineTextAlignment(.center)
                .disabled(true)
                .frame(width: 200)
                .font(Font.system(size: 40, weight: .regular))
            Button(viewModel: viewModel, action: .increase) {
                Text("+")
            }
            .font(Font.system(size: 80, weight: .regular))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(viewModel: .init())
        }
    }
}
