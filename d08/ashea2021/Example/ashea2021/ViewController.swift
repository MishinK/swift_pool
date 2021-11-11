//
//  ViewController.swift
//  ashea2021
//
//  Created by MishinK on 10/01/2021.
//  Copyright (c) 2021 MishinK. All rights reserved.
//

import UIKit
import ashea2021

class ViewController: UIViewController {
    
    let articlemanager = ArticleManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        print("start")
        let art1 = articlemanager.newArticle()
        art1.title = "Art 1"
        art1.content = "Art 1 on d08"
        art1.creation = NSDate()
        art1.modification = NSDate()
        art1.language = "en"
        articlemanager.save()
    
        let art2 = articlemanager.newArticle()
        art2.title = "Art 2"
        art2.content = "Art 2 on d08"
        art2.creation = NSDate()
        art2.modification = NSDate()
        art2.language = "fr"
        articlemanager.save()
        
        print("getAllArticles")
        print(articlemanager.getAllArticles())
        print("getArticles(withLang: \"en\")")
        print(articlemanager.getArticles(withLang: "en"))
        print("getArticles(containString: \"Art 2\")")
        print(articlemanager.getArticles(containString: "Art 2"))
        print("after removeArticle")
        articlemanager.removeArticle(article: art2)
        print("getArticles(containString: \"Art 2\")")
        print(articlemanager.getArticles(containString: "Art 2"))
        print("end")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

