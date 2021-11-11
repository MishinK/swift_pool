//
//  ViewController.swift
//  d06
//
//  Created by Константин Мишин on 29.09.2021.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motionManager = CMMotionManager()
    var dynamicAnimator : UIDynamicAnimator!
    var itemBehavior: UIDynamicItemBehavior!
    var gravityBehavior : UIGravityBehavior!
    var collision : UICollisionBehavior!
    var rotation : UIRotationGestureRecognizer!
    

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        let shape = Shape(frame: CGRect(x: Int(sender.location(in: self.view).x - 50), y: Int(sender.location(in: self.view).y - 50), width: 100, height: 100))
        view.addSubview(shape)
        gravityBehavior.addItem(shape)
        collision.addItem(shape)
        itemBehavior.addItem(shape)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panGesture(pan:)))
        shape.addGestureRecognizer(pan)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture(pinch:)))
        shape.addGestureRecognizer(pinch)
        
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(rotationGesture(rotation:)))
        shape.addGestureRecognizer(rotation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dynamicAnimator = UIDynamicAnimator(referenceView: view)

        gravityBehavior = UIGravityBehavior(items: [])
        dynamicAnimator.addBehavior(gravityBehavior)

        collision = UICollisionBehavior(items: [])
        collision.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collision)
        
        itemBehavior = UIDynamicItemBehavior(items: [])
        itemBehavior.elasticity = 0.5
        dynamicAnimator.addBehavior(itemBehavior)
        
        if (motionManager.isAccelerometerAvailable) {
            motionManager.accelerometerUpdateInterval = 0.3
            motionManager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: updateVector)
        }
    }
    
    @objc func panGesture(pan : UIPanGestureRecognizer) {
        guard pan.view != nil else { return }
        switch pan.state {
        case .began:
                self.gravityBehavior.removeItem(pan.view!)
        case .changed:
                pan.view?.center = pan.location(in: self.view)
                self.dynamicAnimator.updateItem(usingCurrentState: pan.view!)
        case .ended:
                self.gravityBehavior.addItem(pan.view!)
        default:
            break;
        }
    }

    @objc func pinchGesture(pinch : UIPinchGestureRecognizer) {
        guard pinch.view != nil else { return }
        let view = pinch.view as! Shape;
        
        switch pinch.state {
        case .began:
            self.gravityBehavior.removeItem(view);
        case .changed:
            self.collision.removeItem(view);
            self.itemBehavior.removeItem(view);
            view.bounds.size.width = view.originalBounds.width * pinch.scale;
            view.bounds.size.height = view.originalBounds.height * pinch.scale;
            if (view.isCircle == true) {
                view.layer.cornerRadius = view.bounds.size.width / 2
            }
            self.collision.addItem(view);
            self.itemBehavior?.addItem(view);
            self.dynamicAnimator.updateItem(usingCurrentState: view);
        case .ended:
            view.originalBounds = view.bounds;
            self.gravityBehavior.addItem(view);
        default:
            break ;
        }
    }
    
    @objc func rotationGesture(rotation: UIRotationGestureRecognizer) {
        guard rotation.view != nil else { return }
        let view = rotation.view as! Shape
        
        switch rotation.state {
        case .began:
            self.gravityBehavior.removeItem(view)
        case .changed:
            self.collision.removeItem(view);
            self.itemBehavior.removeItem(view);
            rotation.view!.transform = rotation.view!.transform.rotated(by: rotation.rotation);
            rotation.rotation = 0;
            self.collision.addItem(view);
            self.itemBehavior?.addItem(view);
            self.dynamicAnimator.updateItem(usingCurrentState: view);
        case .ended:
            self.gravityBehavior.addItem(view)
        default:
            break;
        }
    }
    
    func updateVector(data: CMAccelerometerData?, error: Error?) -> Void {
        if let d = data {
            self.gravityBehavior.gravityDirection = CGVector(dx: d.acceleration.x, dy: -d.acceleration.y)
        }
    }
}

