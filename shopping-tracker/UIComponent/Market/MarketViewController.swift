//
//  MarketViewController.swift
//  shopping-tracker
//
//  Created by Cristian Ames on 2/13/17.
//  Copyright © 2017 Cristian Ames. All rights reserved.
//

//import Foundation

public class MarketViewController: ViewController {
    
    private var _viewModel: MarketViewModel { return viewModel as! MarketViewModel }
    
    public override func loadView() {
        view = MarketView.loadFromNib()
    }
    
}
