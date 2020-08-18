//
//  ViewController.swift
//  Jalen_T_weather_app
//
//  Created by Jalen Taylor on 8/13/20.
//  Copyright © 2020 Jalen Taylor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
    super.viewDidLoad()

    if let url = NSURL(string:"https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/41.8749440,-87.7169605") {
    if let data = NSData(contentsOf: url as URL){
        do {
        let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
        
        let newdict = parsed
        
        print(newdict["currently"]!["summary"] as Any)
        print(newdict["currently"]!["temperature"] as Any)
        print(newdict["currently"]!["dewpoint"] as Any)
        
        self.currentTemp.text = "\(newdict["currently"]!["temperature"]!!)"
        self.currentsummary.text = "\(newdict["currently"]!["summary"]!!)"
        self.currentlyDewpoint.text = "\(newdict["currently"]!["temperature"]!!)"
        }
        
        
        
        catch let error as NSError {
            print("A JSON parsithng error occurred, here are the details:\n \(error)")
        }
        }
    }
}
    @IBOutlet var currentTemp: UILabel!
    
    @IBOutlet  var currentsummary: UILabel!
    
    @IBOutlet weak var currentlyDewpoint: UILabel!
    
    // Do any additional setup after loading the view.
    }




