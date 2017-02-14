//
//  MyItemsViewController.swift
//  shopping-tracker
//
//  Created by Cristian Ames on 2/13/17.
//  Copyright © 2017 Cristian Ames. All rights reserved.
//

import UIKit

class MyItemsViewController: ViewController {
    
    private var _viewModel: MyItemsViewModel { return viewModel as! MyItemsViewModel }
    private var _view: MyItemsView { return view as! MyItemsView }

    public override func loadView() {
        view = MyItemsView.loadFromNib()
        let tableView = UITableView(frame: _view.tableView.frame)
        tableView.delegate = self
        tableView.loadInto(_view.tableView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        _view.tableView.reloadInputViews()
        // Do any additional setup after loading the view.
    }
    
}

extension MyItemsViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    @nonobjc public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: .none)
        cell.detailTextLabel?.text = "HOLA \(indexPath.row)"
        return cell
    }
    
}
