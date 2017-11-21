//
//  ViewController.swift
//  How it's called?
//
//  Created by Ivan Tikhonov on 20/11/2017.
//  Copyright © 2017 Ivan Tikhonov. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var wordNumber : Int = 0
    var allWords = WordList()
    var dataFromFile = [String]()
    var myArray = [Int]()
    
    @IBOutlet weak var dayWordLbl: UILabel!
    @IBOutlet weak var wordDescriptionLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        myArray = defaults.object(forKey: "SavedStringArray") as? [Int] ?? [Int]()
        
        allWords.list = getDataFromFile(fileName: "wordDB")!
        
        nextWord()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func addFavouriteBtnPressed(_ sender: UIButton) {
        
        if myArray.contains(wordNumber){
            
            print("такое есть!!!111")
            
        } else {
            
            myArray.append(wordNumber)
            print("Добавлено!")
            
        }
        
        let defaults = UserDefaults.standard
        defaults.set(myArray, forKey: "SavedStringArray")
        
    }
    
    
    @IBAction func nextWordBtn(_ sender: UIButton) {
        
        wordNumber += 1
        
        nextWord()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func nextWord() {
        
        wordNumber = Int(arc4random_uniform(UInt32(allWords.list.count)))
        dayWordLbl.text = allWords.list[wordNumber].wordText
        wordDescriptionLbl.text = allWords.list[wordNumber].wordDescription
        
    }
    
    
    func getDataFromFile(fileName: String) -> [WordAndDescription]? {
        guard let path = Bundle.main.path(forResource: "wordDB", ofType: "txt") else {
            return nil
        }
        
        do {
            let content = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
            dataFromFile = content.components(separatedBy: "\n")
            
        } catch {
            return nil
        }
        var wordFromStringInArray = [String]()
        var arrayOfDataFromFile = [WordAndDescription]()
        for i in 0..<dataFromFile.count{
            
            wordFromStringInArray = dataFromFile[i].components(separatedBy: ";")
            arrayOfDataFromFile.append(WordAndDescription(word: wordFromStringInArray[0], description: wordFromStringInArray[1]))
            
        }
        return arrayOfDataFromFile
        
    }


}

