//
//  ContentViewModel.swift
//  Demo
//
//  Created by Yuto Akiba on 2020/11/13.
//

import Foundation
import Combine
import SwiftUI
import Fluxer

final class ContentViewModel: ViewModel {
    enum Action {
        case increase
        case decrease
    }

    enum Mutation {
        case increaseValue
        case decreaseValue
    }

    class State: ObservableObject {
        @Published var number = 0
    }

    @Published var state = State()

    init() {
        initilize()
    }

    func mutate(action: Action) -> AnyPublisher<Mutation, Never> {
        switch action {
        case .increase:
            return Just(Mutation.increaseValue).eraseToAnyPublisher()
        case .decrease:
            return Just(Mutation.decreaseValue).eraseToAnyPublisher()
        }
    }

    func reduce(mutation: Mutation) {
        switch mutation {
        case .increaseValue:
            state.number += 1
        case .decreaseValue:
            state.number -= 1
        }
    }

    // Timer event
//    func transform(mutation: AnyPublisher<Mutation, Never>) -> AnyPublisher<Mutation, Never> {
//        let m = Timer.publish(every: 1.0, on: .main, in: .common)
//            .autoconnect()
//            .map { _ in Mutation.increaseValue }
//
//        return mutation.merge(with: m).eraseToAnyPublisher()
//    }
}

final class APIClient {
    static func send() -> Future<Int, Error> {
        return Future { promise in
            promise(.success(1))
        }
    }
}

