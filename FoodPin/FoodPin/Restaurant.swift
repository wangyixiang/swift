//
//  Restaurant.swift
//  FoodPin
//
//  Created by yixiang.wang on 4/9/15.
//  Copyright (c) 2015 wangyixiang. All rights reserved.
//

import Foundation
import CoreData

class Restaurant: NSManagedObject {
    @NSManaged var name:String!
    @NSManaged var type:String!
    @NSManaged var location:String!
    @NSManaged var image:NSData!
    @NSManaged var isVisited:NSNumber!
}