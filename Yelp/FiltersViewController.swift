//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Brian Hillsley on 1/26/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol FiltersViewControllerDelegate {
    optional func filtersViewController(filteresViewController: FiltersViewController, didUpdateFilters filters: [String:AnyObject])
}

class FiltersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwitchCellDelegate {

    // Array of dictionaries with display name and in-code identifier
    var categories: [[String:String]]!
    
    // Dictionary keyed by the cell row #
    var switchStates = [Int:Bool]() // # Row : State
    
    weak var delegate: FiltersViewControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func onSearchButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
        var filters = [String:AnyObject]()
        
        var selectedCategories = [String]()
        
        // iteration over dictionary
        for (row,isSelected) in switchStates {
            if isSelected {
                selectedCategories.append(categories[row]["code"]!)
            }
        }
        if selectedCategories.count > 0 {
            filters["categories"] = selectedCategories
        }
        
        // Calling the delegate event
        delegate?.filtersViewController?(self, didUpdateFilters: filters)
    }
    
    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        categories = yelpCategories()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func  tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCell
        
        cell.switchLabel.text = categories[indexPath.row]["name"]
        cell.delegate = self
        
        //if switchStates[indexPath.row] != nil {
        //    cell.onSwitch.on = switchStates[indexPath.row]!
        //} else {
        //    cell.onSwitch.on = false
        //}
        
        // ternary operater returns boolean value (nice shortcut for nil check)
        // false when nil, otherwise whatever its value is
        cell.onSwitch.on = switchStates[indexPath.row] ?? false
        
        return cell
    }
    
    func yelpCategories() -> [[String:String]] {
        return [["name" : "Afghan",       "code" : "afghani"],
                ["name" : "African",      "code" : "african"],
                ["name" : "American",     "code" : "newamerican"],
                ["name" : "Asian Fusion", "code" : "asianfusion"],
                ["name" : "Baguettes",    "code" : "baguettes"],
                ["name" : "Thai",         "code" : "thai"],
                ["name" : "Tex-Mex",      "code" : "tex-mex"],
                ["name" : "Chinese",      "code" : "chinese"]]
    }

    func switchCell(switchCell: SwitchCell, didChange value: Bool){
        let indexPath = tableView.indexPathForCell(switchCell)!
        
        switchStates[indexPath.row] = value
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
