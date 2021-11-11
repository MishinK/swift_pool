//
//  Article+CoreDataProperties.swift
//  ashea2021
//
//  Created by Константин Мишин on 01.10.2021.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    public static func printArticle(article: Article) {
         print()
         print(article.title ?? "nil")
         print(article.language ?? "nil")
         print(article.creation ?? "nil")
         print(article.modification ?? "nil")
         print(article.content ?? "nil")
         print(article.image ?? "nil")
     }

}
