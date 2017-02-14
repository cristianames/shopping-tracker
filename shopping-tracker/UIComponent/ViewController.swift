//
//  ViewController.swift
//  shopping-tracker
//
//  Created by Cristian Ames on 2/13/17.
//  Copyright © 2017 Cristian Ames. All rights reserved.
//

import UIKit

open class ViewController: UIViewController {
    
    open let viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    open func bindViewModel() { }
    
    open func unbindViewModel() { }
    
    deinit {
        unbindViewModel()
    }
    
}

