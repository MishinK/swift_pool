//
//  ViewController.swift
//  d03
//
//  Created by Константин Мишин on 24.09.2021.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var ScrollView: UIScrollView!
    
    var imageView : UIImageView?
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView = UIImageView(image: image)
        ScrollView.addSubview(imageView!)
        ScrollView.contentSize = (imageView?.frame.size)!
    }
    
    override func viewWillLayoutSubviews() {
        var minZoom = min(self.view.bounds.size.width / imageView!.bounds.size.width, self.view.bounds.size.height / imageView!.bounds.size.height);
        
        if (minZoom > 1.0) {
            minZoom = 1.0;
        }
        ScrollView.maximumZoomScale = 100
        ScrollView.minimumZoomScale = minZoom;
        ScrollView.zoomScale = minZoom;
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

