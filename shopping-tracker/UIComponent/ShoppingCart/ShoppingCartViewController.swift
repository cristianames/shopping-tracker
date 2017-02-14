//
//  ShoppingCartViewController.swift
//  shopping-tracker
//
//  Created by Cristian Ames on 2/13/17.
//  Copyright © 2017 Cristian Ames. All rights reserved.
//

public class ShoppingCartViewController: ViewController {
    
    private var _viewModel: ShoppingCartViewModel { return viewModel as! ShoppingCartViewModel }
    
    public override func loadView() {
        view = ShoppingCartView.loadFromNib()
    }
    
}
