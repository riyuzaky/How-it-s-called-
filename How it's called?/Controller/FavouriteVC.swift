//
//  FavouriteVC.swift
//  How it's called?
//
//  Created by Ivan Tikhonov on 21/11/2017.
//  Copyright © 2017 Ivan Tikhonov. All rights reserved.
//

import UIKit

class FavouriteVC: UITableViewController {
    
    var arrayOfIndexes = [Int]()
    var arrayOfDataFromMainVC = [WordAndDescription]()
    var arrayOfFavouriteWord = [String]()
    var tempCell : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        arrayOfIndexes = defaults.object(forKey: "SavedStringArray") as? [Int] ?? [Int]()
        
        let myVC = self.tabBarController?.viewControllers![0] as! ViewController
        arrayOfDataFromMainVC = myVC.allWords.list

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        arrayOfIndexes = defaults.object(forKey: "SavedStringArray") as? [Int] ?? [Int]()
        
        arrayOfFavouriteWord = getTextForIndex(a: arrayOfDataFromMainVC, b: arrayOfIndexes)
        
        super.viewWillAppear(animated)
        tableView.reloadData()
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return(arrayOfIndexes.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = arrayOfFavouriteWord[indexPath.row]
    
        return (cell)
    }
    
    func getTextForIndex(a: [WordAndDescription], b: [Int]) -> [String] {
        var out = [String]()
        
        for i in 0..<b.count {
            
            out.append(a[b[i]].wordText)
        }
        
    return out
    }
    
    // method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to the second view controller
        tempCell = arrayOfIndexes[indexPath.row]
        self.performSegue(withIdentifier: "mySegue", sender: self)
        
    }
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let secondViewController = segue.destination as! DetailedVC
        secondViewController.currentWordNumber = tempCell
        // set a variable in the second view controller with the data to pass
        //secondViewController.receivedData = "hello"
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let myVC = self.tabBarController?.viewControllers![0] as! ViewController
            myVC.myArray.remove(at: indexPath.row)
            arrayOfIndexes.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            let defaults = UserDefaults.standard
            defaults.set(arrayOfIndexes, forKey: "SavedStringArray")
            defaults.set(myVC.myArray, forKey: "SavedStringArray")
            defaults.synchronize()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
    }
    

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
