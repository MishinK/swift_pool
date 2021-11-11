import UIKit

class ViewController: UIViewController {
    //ex00-ex01
    var f: Bool! = true;
    @IBOutlet weak var outtxt: UILabel!
    
    
    @IBAction func click(_ sender: Any) {
        if (f){
            outtxt.text = "Hello World!";
            f = false;
        }
        else{
            outtxt.text = "Stop pressing!";
            f = true;
        }
        print("Hello World!");
    }
    
    //ex02-ex04
    var operateur: String = "";
    var n1: Int! = nil;
    var n2: Int! = nil;
    
    @IBOutlet weak var Answer: UILabel!
    
    func egal() {
        if (n2 != nil && operateur != ""){
            var resultat: Int? = nil;
            var bool: Bool = false
            switch operateur {
            case "+":
                resultat = n1! &+ n2!
            case "/":
                if(n1 == 0 || n2 == 0) {
                    n1 = nil
                    n2 = nil
                    Answer.text = "Error"
                    operateur = ""
                    bool = true
                } else {
                    resultat = n1! / n2!
                }
            case "*":
                resultat = n1! &* n2!
            default:
                resultat = n1! &- n2!
            }
            if (bool == false) {
                n1 = resultat
                n2 = nil
                Answer.text = String(resultat!)
            }
        }
    }
    
    @IBAction func buttonTapped(TheButton : UIButton){
        let trapped = TheButton.titleLabel!.text!
        print(trapped)
        let isNumberType = Int(trapped)
        if (isNumberType != nil) {
            if (n1 != nil && operateur != "") {
                if (n2 != nil) {
                    n2 =  (n2! &* 10) &+ isNumberType!
                } else {
                    n2 = isNumberType
                }
                Answer.text = String(n2)
            } else {
                if (n1 != nil) {
                 n1 = (n1! &* 10) &+ isNumberType!
                } else {
                    n1 = isNumberType
                }
                Answer.text = String(n1)
            }
        } else {
            switch trapped {
            case "NEG":
                if (n2 != nil) {
                    n2 = n2! &* -1
                    Answer.text = String(n2!)
                } else if (n1 != nil){
                    n1 = n1! &* -1
                    Answer.text = String(n1!)
                }
            case "AC":
                n1 = nil
                n2 = nil
                operateur = ""
                Answer.text = "0"
            case "=":
                egal()
            default:
                if (operateur != "") {
                    egal()
                }
                operateur = trapped
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }

}

