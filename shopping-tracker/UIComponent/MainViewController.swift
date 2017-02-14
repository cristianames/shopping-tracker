//
//  MainViewController.swift
//  shopping-tracker
//
//  Created by Cristian Ames on 2/12/17.
//  Copyright © 2017 Cristian Ames. All rights reserved.
//

import UIKit

public class MainViewController: UITabBarController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        let controllers = createTabs()
        self.viewControllers = controllers
        selectedIndex = 1
        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension MainViewController: UITabBarControllerDelegate {
    
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title) ?")
        return true;
    }
    
}


fileprivate func createTabs() -> [UIViewController] {
    let myItems = MyItemsViewController(viewModel: MyItemsViewModel())
    let myItemsIcon = UITabBarItem(title: "MyItems",
                                   image: UIImage(identifier: .bagInactive),
                                   selectedImage: UIImage(identifier: .bagActive))
    myItems.tabBarItem = myItemsIcon
    
    let market = MarketViewController(viewModel: MarketViewModel())
    let marketIcon = UITabBarItem(title: "Market",
                                   image: UIImage(identifier: .marketInactive),
                                   selectedImage: UIImage(identifier: .marketActive))
    market.tabBarItem = marketIcon
    
    let shoppingCart = ShoppingCartViewController(viewModel: ShoppingCartViewModel())
    let shoppingCartIcon = UITabBarItem(title: "Shopping Cart",
                                   image: UIImage(identifier: .shoppingCartInactive),
                                   selectedImage: UIImage(identifier: .shoppingCartActive))
    shoppingCart.tabBarItem = shoppingCartIcon
    
    
    return [myItems, market, shoppingCart]
}
