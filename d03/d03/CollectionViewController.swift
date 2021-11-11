//
//  CollectionViewController.swift
//  d03
//
//  Created by Константин Мишин on 24.09.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    @IBOutlet var ImageCollectionView: UICollectionView!
    
    let nasaImages : [String] = [
        "https://images-assets.nasa.gov/image/PIA01384/PIA01384~orig.jpg",
        "https://images-assets.nasa.gov/image/iss061e129986/iss061e129986~orig.jpg",
        "https://images-assets.nasa.gov/image/PIA18033/PIA18033~orig.jpg",
        "https://images-assets.nasa.gov/image/behemoth-black-hole-found-in-an-unlikely-place_26209716511_o/behemoth-black-hole-found-in-an-unlikely-place_26209716511_o~orig.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/43656168861_3c30e55b14_o.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/florence.jpeg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/45025340661_7b9f8f9402_k.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/8.22-396o5017lane.jpg"
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.ImageCollectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
       // self.ImageCollectionView.delegate = self
       // self.ImageCollectionView.dataSource = self
    
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return nasaImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImagesCollectionViewCell
        loadImage(image: self.nasaImages[indexPath.row], cell: cell)
        return cell
    }

    func loadImage(image : String, cell : ImagesCollectionViewCell) {
        cell.ImageLabel.isHidden = false
        cell.ImageLoadIndicator.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url = URL(string: image)
        let task = URLSession.shared.dataTask(with: url!) {
            data, response, error in
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            DispatchQueue.main.async {
                if data != nil {
                    cell.ImageLoadIndicator.isHidden = true
                    cell.ImageLoadIndicator.stopAnimating()
                    cell.ImageLabel.image = UIImage(data: data! as Data)
                }
            }
        }
        task.resume()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let seq = segue.destination as! ViewController
        let cell = sender! as! ImagesCollectionViewCell
        if cell.ImageLabel.image != nil {
            seq.image = cell.ImageLabel.image!
        } else {
            let alertController = UIAlertController(title: "Error", message: "Cannot acces to this image", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
     
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
