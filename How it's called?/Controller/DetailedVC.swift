//
//  DetailedVC.swift
//  How it's called?
//
//  Created by Ivan Tikhonov on 21/11/2017.
//  Copyright © 2017 Ivan Tikhonov. All rights reserved.
//

import UIKit

class DetailedVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var receivedData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(receivedData)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
