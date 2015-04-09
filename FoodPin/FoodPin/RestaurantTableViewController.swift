//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by yixiang.wang on 4/7/15.
//  Copyright (c) 2015 wangyixiang. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    var restaurantNames = ["黄焖鸡米饭", "温州面馆", "观秦轩", "老街小食", "老薛面馆", "小杨生煎", "水饺","黄焖鸡米饭", "温州面馆", "观秦轩", "老街小食", "老薛面馆", "小杨生煎", "水饺"]
    var restaurantImage = ["barrafina.jpg","bourkestreetbakery.jpg","cafedeadend.jpg","cafeloisl.jpg","cafelore.jpg","confessional.jpg","donostia.jpg","barrafina.jpg","bourkestreetbakery.jpg","cafedeadend.jpg","cafeloisl.jpg","cafelore.jpg","confessional.jpg","donostia.jpg"]
    var restaurantLocations = ["上海","上海","上海","上海","上海","上海","上海","上海","上海","上海","上海","上海","上海","上海"]
    var restaurantTypes = ["饭食","面食","面食","本帮菜","面食","面食","面食","饭食","面食","面食","本帮菜","面食","面食","面食"]
    var restaurantIsVisited = [Bool](count: 14, repeatedValue: false)

    var restaurants:[Restaurant] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        if restaurants.count == 0 {
        for (var i=0; i < self.restaurantNames.count; i++) {
            self.restaurants.append(
                Restaurant(
                    name: restaurantNames[i],
                    type: restaurantTypes[i],
                    location: restaurantLocations[i],
                    image: restaurantImage[i],
                    isVisited: restaurantIsVisited[i])
            )
        }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        //return restaurantNames.count
        return restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as CustomTableViewCell
//        cell.nameLable.text = restaurantNames[indexPath.row]
//        cell.locationLabel.text = restaurantLocations[indexPath.row]
//        cell.typeLabel.text = restaurantTypes[indexPath.row]
//        cell.thumbnailImageView.image = UIImage(named: restaurantImage[indexPath.row])
        cell.nameLable.text = restaurants[indexPath.row].name
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
//        cell.accessoryType = self.restaurantIsVisited[indexPath.row] ? .Checkmark:.None
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .Checkmark:.None
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        let callActionHandle = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet.", preferredStyle: UIAlertControllerStyle.Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
            
        }
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .Default, handler: callActionHandle)
        optionMenu.addAction(callAction)
        
        let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: {
            (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
//            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .Checkmark : .None
            self.restaurants[indexPath.row].isVisited = !self.restaurants[indexPath.row].isVisited
            cell?.accessoryType = self.restaurants[indexPath.row].isVisited ? .Checkmark : .None
        })
        
        optionMenu.addAction(isVisitedAction)
        self.presentViewController(optionMenu, animated: true, completion: nil	)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
//            self.restaurantNames.removeAtIndex(indexPath.row)
//            self.restaurantLocations.removeAtIndex(indexPath.row)
//            self.restaurantTypes.removeAtIndex(indexPath.row)
//            self.restaurantIsVisited.removeAtIndex(indexPath.row)
//            self.restaurantImage.removeAtIndex(indexPath.row)
            var row = indexPath.row
            self.restaurants.removeAtIndex(row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject] {
        var shareAction = UITableViewRowAction(style: .Default, title: "Share", handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            
            let twitterAction = UIAlertAction(title: "Tweet it", style: UIAlertActionStyle.Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)

            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
            
            }
        )
        
        var deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
//            self.restaurantNames.removeAtIndex(indexPath.row)
//            self.restaurantLocations.removeAtIndex(indexPath.row)
//            self.restaurantTypes.removeAtIndex(indexPath.row)
//            self.restaurantIsVisited.removeAtIndex(indexPath.row)
//            self.restaurantImage.removeAtIndex(indexPath.row)
            var row = indexPath.row
            self.restaurants.removeAtIndex(row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        )
        
        shareAction.backgroundColor = UIColor(red: 255/255.0, green: 166/255.0, blue: 51/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as DetailViewController
//                destinationController.restaurantImage = self.restaurantImage[indexPath.row]
                destinationController.restaurantImage = self.restaurants[indexPath.row].image
            }
        }
    }

}
