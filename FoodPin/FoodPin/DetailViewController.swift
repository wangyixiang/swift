//
//  DetailViewController.swift
//  FoodPin
//
//  Created by yixiang.wang on 4/9/15.
//  Copyright (c) 2015 wangyixiang. All rights reserved.
//

import UIKit

// TODO 利用AutoLayout 解决landscape的排版问题
class DetailViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var tableView:UITableView!
    var restaurant:Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.restaurantImageView.image = UIImage(named: self.restaurant.image)
        self.tableView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 0.2)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.separatorColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 0.2)
        self.title = restaurant.name
        //tableView.estimatedRowHeight = 36.0
        //tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
            cell.mapButton.hidden = true
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
            cell.mapButton.hidden = true
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Been There"
            cell.valueLabel.text = (restaurant.isVisited) ? "Yes!" : "No"
            cell.mapButton.hidden = true
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
            cell.mapButton.hidden = true
        }
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showMap" {
            let destinationController = segue.destinationViewController as MapViewController
            destinationController.restaurant = restaurant
        }
    }


}
