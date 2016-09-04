//
//  PagarViewController.swift
//  Ejemplos
//
//  Created by Eden Torres on 8/30/16.
//  Copyright © 2016 Eden Torres. All rights reserved.
//

import UIKit

class PagarViewController: UIViewController {
    
    var paymentTypeId: String?

    @IBAction func pagar(sender: AnyObject) {
        let congratsViewController = CongratsViewController()
        congratsViewController.paymentTypeId = self.paymentTypeId
        self.navigationController?.presentViewController(congratsViewController, animated: true) {
            self.navigationController?.popToRootViewControllerAnimated(true)
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
