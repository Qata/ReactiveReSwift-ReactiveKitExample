//
//  AppDelegate.swift
//  ReactiveReSwift-ReactiveKitExample
//
//  Created by Charlotte Tortorella on 2/12/16.
//  Copyright © 2016 ReSwift. All rights reserved.
//

import UIKit
import ReactiveReSwift
import ReactiveKit

let middleware = Middleware<AppState>().sideEffect { _, _, action in
    print("Received action:")
    let mirror = String(describing: AppState.self)
    print(mirror.description)
}.sideEffect { _, _, action in
    print(action)
}

// The global application store, which is responsible for managing the appliction state.
let mainStore = Store(
    reducer: counterReducer,
    stateType: AppState.self,
    observable: Property(AppState()),
    middleware: middleware
)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
}

