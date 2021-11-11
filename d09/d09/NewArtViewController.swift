//
//  NewArtViewController.swift
//  d09
//
//  Created by Константин Мишин on 02.10.2021.
//

import UIKit
import ashea2021
class NewArtViewController: UIViewController {

    
    @IBOutlet weak var art_title: UITextField!
    
    @IBOutlet weak var art_image: UIImageView!
    
    @IBOutlet weak var art_content: UITextView!
    
    let pickerController = UIImagePickerController()
    var aM : ArticleManager?
    let langStr = NSLocale.preferredLanguages.first
    var art: Article?
    var reloadData: Bool = false
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func Take_art(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func Choose_art(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            
            present(imagePicker, animated: true, completion: nil)
        }
    }

    func alert (message: String) {
        let alertController = UIAlertController(title: "Error", message:
                                                    message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func save_art(_ sender: Any) {
        if art_title.text == nil || art_title.text == "" {
            alert(message: "Can't save without a title!")
            return
        }
        if art == nil {
            art = aM!.newArticle()
            art!.creation = NSDate()
            art!.language = langStr
        } else {
            art!.modification = NSDate()
        }
        art!.title = art_title.text
        art!.content = art_content.text
        if art_image.image != nil {
            art!.image = art_image.image!.pngData()! as NSData
        }
        aM!.save()
        reloadData = true
        performSegue(withIdentifier: "segBack", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerController.delegate = self
        
        if art != nil {
            art_title.text = art!.title
            art_content.text = art!.content
            if art!.image != nil {
                art_image.image = UIImage(data: art!.image! as Data)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segBack" {
            if let vc = segue.destination as? TableViewController {
                     vc.reloadData = reloadData
                }
            }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewArtViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        art_image.image = info[.originalImage] as? UIImage
        print(info)
        
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
