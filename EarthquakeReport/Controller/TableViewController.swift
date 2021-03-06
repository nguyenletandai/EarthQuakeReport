//
//  TableViewController.swift
//  EarthquakeReport
//
//  Created by daicudu on 4/1/19.
//  Copyright © 2019 daicudu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var earthQuakeInfos: [EarthQuakeInfo.Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        DataService.shared.request { (earthQuakeInfos) in
            self.earthQuakeInfos = earthQuakeInfos
            self.tableView.reloadData()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return earthQuakeInfos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let earthQuakeInfo = earthQuakeInfos[indexPath.row]
        cell.magLabel.text = "\(earthQuakeInfo.mag!)"
        cell.distanceLabel.text = earthQuakeInfo.distanceString
        cell.locationLabel.text = earthQuakeInfo.locationName
        cell.dateLabel.text = earthQuakeInfo.dateString
        cell.timeLabel.text = earthQuakeInfo.timeString

        // Configure the cell...

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destination.urlFromTableView = earthQuakeInfos[indexPath.row].url
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
