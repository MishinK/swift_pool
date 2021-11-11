//
//  TableViewController.swift
//  d09
//
//  Created by Константин Мишин on 02.10.2021.
//

import UIKit
import ashea2021
class TableViewController: UITableViewController {

    let langStr = NSLocale.preferredLanguages.first
    let aM = ArticleManager()
    var arts: [Article] = []
    var reloadData: Bool = false
    var artDel: Article? = nil
    
    @IBOutlet var tabArticles: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabArticles.delegate = self
        tabArticles.dataSource = self
        loadArts()
        tabArticles.rowHeight = UITableView.automaticDimension
    }
    
    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
   }
    func loadArts() {
        arts = []
        arts = aM.getArticles(withLang: langStr!)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellArt", for: indexPath) as! TableViewCell
        cell.title.text = arts[indexPath.row].title
        if arts[indexPath.row].image != nil {
            let i = UIImage(data: arts[indexPath.row].image! as Data)
            cell.imageart.image = i
            cell.imageart.isHidden = false
        } else {
            cell.imageart.isHidden = true
        }
        cell.content.text = arts[indexPath.row].content
        let d = DateFormatter()
        d.locale = Locale(identifier: langStr!)
        d.setLocalizedDateFormatFromTemplate("MMM dd, YYYY 'at' HH:mm")
        cell.creation.text = "Creation: \(d.string(from: arts[indexPath.row].creation! as Date))"
        if arts[indexPath.row].modification != nil {
            cell.modification.text = "Modification: \(d.string(from: arts[indexPath.row].modification! as Date))"
            cell.modification.isHidden = false
        } else {
            cell.modification.isHidden = true
        }
        return cell
    }
    
    internal override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segMod", sender: indexPath.row)
    }

      @IBAction func unWindsegue(segue: UIStoryboardSegue) {
        if reloadData {
            loadArts()
            tabArticles.reloadData()
        }
     }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segMod" {
            if let vc = segue.destination as? NewArtViewController {
                let row = sender as! Int
                vc.aM = aM
                print(arts[row].title!)
                vc.art = arts[row]
            }
        } else if segue.identifier == "segCrea" {
            if let vc = segue.destination as? NewArtViewController {
                vc.aM = aM
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            artDel = arts[indexPath.row]
            confirmDelete(art: artDel!.title!)
 
        }
    }
    
    func confirmDelete(art: String) {
        let alert = UIAlertController(title: "Delete article", message: "Are you sure you want to permanently delete \(art)?", preferredStyle: .actionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: handleDeleteArt)
        let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelDeleteArt)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    func handleDeleteArt(alertAction: UIAlertAction!) -> Void {
        aM.removeArticle(article: artDel!)
        loadArts()
        tabArticles.reloadData()
        artDel = nil
     }
    func cancelDeleteArt(alertAction: UIAlertAction!) {
        artDel = nil
    }

}
