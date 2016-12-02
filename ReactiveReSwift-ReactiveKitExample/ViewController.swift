//
//  ViewController.swift
//  ReactiveReSwift-ReactiveKitExample
//
//  Created by Charlotte Tortorella on 2/12/16.
//  Copyright © 2016 ReSwift. All rights reserved.
//

import UIKit
import ReactiveReSwift
import ReactiveKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let disposable = mainStore.observable.map { String($0.counter) }.observeNext { [weak self] value in
            self?.counterLabel.text = value
        }
        disposeBag.add(disposable: disposable)
    }
    
    // when either button is tapped, an action is dispatched to the store
    // in order to update the application state
    @IBAction func downTouch(_ sender: AnyObject) {
        // This is just to demonstrate that you can dispatch signals directly,
        // don't actually do this, this is bad code
        mainStore.dispatch(Signal<AppAction, NoError>.just(.decrease))
    }
    
    @IBAction func upTouch(_ sender: AnyObject) {
        // This is just to demonstrate that you can dispatch signals directly,
        // don't actually do this, this is bad code
        mainStore.dispatch(Signal<AppAction, NoError>.just(.increase))
    }
}

