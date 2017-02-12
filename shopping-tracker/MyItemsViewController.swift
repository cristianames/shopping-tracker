//
//  MyItemsViewController
//  shopping-tracker
//
//  Created by Cristian Ames on 2/5/17.
//  Copyright © 2017 Cristian Ames. All rights reserved.
//

import UIKit

class MyItemsViewController: UIViewController {
    
    @IBOutlet weak var itemButton: UIButton!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var itemsTable: UITableView!
    
    private var tableController: MyItemsTableViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableController = MyItemsTableViewController(style: .plain)
        
        itemsTable.delegate = tableController
        
//        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
//        definesPresentationContext = true
//        tableView.tableHeaderView = searchController.searchBar
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

