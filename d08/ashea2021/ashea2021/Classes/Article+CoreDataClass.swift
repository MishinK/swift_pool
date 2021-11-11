//
//  Article+CoreDataClass.swift
//  ashea2021
//
//  Created by Константин Мишин on 01.10.2021.
//
//

import Foundation
import CoreData

@objc(Article)
public class Article: NSManagedObject {
    
    @NSManaged public var content: String?
    @NSManaged public var title: String?
    @NSManaged public var language: String?
    @NSManaged public var image: NSData?
    @NSManaged public var modification: NSDate?
    @NSManaged public var creation: NSDate?
    
    public override var description: String {return
        """
        title \(title ?? "nil")
        content \(content ?? "nil")
        creation \(String(describing: creation))
        modification \(String(describing: modification))
        image \(String(describing: image))
        language \(language ?? "nil")
        """
    }
}
