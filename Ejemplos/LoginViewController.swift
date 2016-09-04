//
//  LoginViewController.swift
//  LoginExample
//
//  Created by Eden Torres on 9/4/16.
//  Copyright © 2016 Eden Torres. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBAction func logIn(sender: AnyObject) {
        let user = User();
        user.username = userName.text
        user.password = passWord.text
        Context.setUser(user)
        self.navigationController?.popToRootViewControllerAnimated(true)
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
