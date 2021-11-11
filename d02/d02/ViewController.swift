//
//  ViewController.swift
//  d02
//
//  Created by Константин Мишин on 23.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var Table: UITableView!
    
    @IBAction func unWindSegue(segue: UIStoryboardSegue) {
        print(segue.identifier!)
        Table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Data.names.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeathTable") as! DeathTableViewCell
            cell.DeathTable = Data.names[indexPath.row]
            cell.NameLabel?.numberOfLines = 0
            cell.DescriptionLabal?.numberOfLines = 0
            cell.DateLabel?.numberOfLines = 0
            Table.rowHeight = UITableView.automaticDimension
            Table.estimatedRowHeight = 100
            return cell
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
