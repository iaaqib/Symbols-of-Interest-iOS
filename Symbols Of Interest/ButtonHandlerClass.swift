//
//  ButtonHandlerClass.swift
//  Symbols Of Interest
//
//  Created by Aaqib Hussain on 05/04/2015.
//  Copyright (c) 2015 Aaqib Hussain. All rights reserved.
//

import UIKit

class ButtonHandlerClass: UIViewController{

    @IBOutlet var openLinks: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func myGooglePlus(sender: AnyObject) {
        let url = NSURL(string: "http://www.plus.google.com/+AaqibHussain");
        let requestURL = NSURLRequest(URL: url!)
        openLinks?.loadRequest(requestURL);
        
    
    
    }
    @IBAction func myTumblr(sender: AnyObject) {
        let url = NSURL(string: "http://www.aaqibhussain.tumblr.com");
        let requestURL = NSURLRequest(URL: url!)
        openLinks?.loadRequest(requestURL);
        
    
    }
    @IBAction func myTwitter(sender: AnyObject) {
        let url = NSURL(string: "http://www.twitter.com/iaaqibhussain");
        let requestURL = NSURLRequest(URL: url!)
        openLinks?.loadRequest(requestURL);
        
    }
    @IBAction func deusExMachina(sender: AnyObject) {
let url = NSURL(string: "http://www.personofinterest.wikia.com/wiki/The_Machine");
        let requestURL = NSURLRequest(URL: url!)
        openLinks?.loadRequest(requestURL);
     
    }
   // @IBAction func abtDev(sender: AnyObject) {
    //}
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
