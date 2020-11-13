# Fluxer 
Flux + ViewModel framework for SwiftUI
(inspired by [ReactorKit](https://github.com/ReactorKit/ReactorKit))

(⚠️ Don't use in production yet)

## Requirements
- Swift 5.2+
- iOS 13+

## Installation
Fluxer only support Swift Package Manager

## Usage

### 1. Create ViewModel
```swift
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
        // Don't forget to call this function
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
}
```


### 2. Instantiate ViewModel in View
```swift
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
```

Fluxer have some useful initializers for Views.

The following two codes have the same meaning.
```swift
Button(viewModel: viewModel, action: .decrease) {
    Text("-")
}
```

```swift
Button(action: {
    viewModel.action.send(.decrease)
}) {
    Text("-")
}
```

## Demo
```
$ open Fluxer.xcodeproj/
```
