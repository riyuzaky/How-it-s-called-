//
//  DetailedVC.swift
//  How it's called?
//
//  Created by Ivan Tikhonov on 21/11/2017.
//  Copyright © 2017 Ivan Tikhonov. All rights reserved.
//

import UIKit

class DetailedVC: UIViewController {
    
    var testArray = [WordAndDescription]()
    var currentWordNumber : Int = 0

    
    @IBOutlet weak var wordLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    //var receivedData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentWord()
        print(currentWordNumber, "при загрузке")
        //print(receivedData)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        currentWord()
        print(currentWordNumber, "при обновлении экрана")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func currentWord() {
        
        let myNewVC = tabBarController?.viewControllers![0] as! ViewController
        let newFavouriteVC = self.navigationController?.viewControllers[0] as! FavouriteVC
        
        testArray = myNewVC.allWords.list
        wordLbl.text = testArray[currentWordNumber].wordText
        descriptionLbl.text = testArray[currentWordNumber].wordDescription
        
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
