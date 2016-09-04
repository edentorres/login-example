//
//  InicioTableViewController.swift
//  Ejemplos
//
//  Created by Eden Torres on 8/30/16.
//  Copyright © 2016 Eden Torres. All rights reserved.
//

import UIKit

class InicioTableViewController: UITableViewController {
    
    var dataSourceArray:[ObjectModel]?;
    var p : PaymentMethodSearch = PaymentMethodSearch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var rightAddBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "Log in", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(addTapped))
        self.navigationItem.setRightBarButtonItems([rightAddBarButtonItem], animated: true)
        if (dataSourceArray == nil) {
//            dataSourceArray = GruposSingleton.getGrupos()
                var pm:PaymentMethodSearchService = PaymentMethodSearchService()
                pm.getPaymentMethods(200.0, publicKey: "TEST-ad365c37-8012-4014-84f5-6c895b3f8e0a") { (paymentMethodSearch) in
                    
                    self.p = paymentMethodSearch
                    self.dataSourceArray = paymentMethodSearch.groups
                    self.tableView.reloadData()
                }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func addTapped (sender:UIButton) {
        print("add pressed")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (dataSourceArray == nil){
            return 0
        } else {
            return (dataSourceArray?.count)!
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = dataSourceArray![indexPath.row].name
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
           let objectModel = dataSourceArray![indexPath.row]
        
        if let grupo = objectModel as? Grupo {
            let inicoViewController = InicioTableViewController()
            self.navigationController?.pushViewController(inicoViewController, animated: true)
            inicoViewController.dataSourceArray = grupo.children
        }
        else {
            let pVC = PagarViewController()
            pVC.paymentTypeId = (objectModel as! PaymentMethod)._id
            self.navigationController?.pushViewController(pVC, animated: true)
            
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
