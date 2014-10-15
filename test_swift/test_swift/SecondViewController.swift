//
//  SecondViewController.swift
//  test_swift
//
//  Created by 加藤 隆義 on 2014/10/05.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var newimgView: UIImageView!
    
    var name : AnyObject?{
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("name")
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        newimgView.image = UIImage(named: name as String)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
