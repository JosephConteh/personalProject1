//
//  Person.swift
//  Project10Swift100
//
//  Created by Field Employee on 9/28/22.
//

import UIKit

class Person: NSObject, Codable {
    
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }

}
