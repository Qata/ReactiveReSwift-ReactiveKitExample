//
//  ReactiveReSwiftBridge.swift
//  ReactiveReSwift-ReactiveKitExample
//
//  Created by Charlotte Tortorella on 2/12/16.
//  Copyright © 2016 ReSwift. All rights reserved.
//

import ReactiveKit
import ReactiveReSwift

extension Signal: StreamType {
    public typealias ValueType = Element
    public typealias DisposableType = DisposableWrapper
    
    public func subscribe(_ function: @escaping (Element) -> Void) -> DisposableWrapper? {
        return DisposableWrapper(disposable: self.observeNext(with: function))
    }
}

extension Property: ObservablePropertyType {
    public typealias ValueType = Value
    public typealias DisposableType = DisposableWrapper

    public func subscribe(_ function: @escaping (Value) -> Void) -> DisposableWrapper? {
        return DisposableWrapper(disposable: observeNext(with: function))
    }
}

public struct DisposableWrapper: SubscriptionReferenceType {
    let disposable: Disposable
    
    public func dispose() {
        disposable.dispose()
    }
}
