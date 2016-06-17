//
//  ViewController.swift
//  SlotMachine
//
//  Created by Kristin Kamenar on 6/17/16.
//  Copyright © 2016 Kristin Kamenar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    //create an array of emojis
    //array: a collection of ordered values
    var slotEmojis = ["😡","😎","😈","👻","💩"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(slotEmojis.count)
    }

    @IBAction func screenTap(sender: UITapGestureRecognizer) {
        
        //print("tapped")
        
        //generate random numbers to choose symbols for labels
        //convert int parameter to a UInt32 and cast entire value back to an Int
        let randomEmoji1 = Int(arc4random_uniform(UInt32(slotEmojis.count)))
        let randomEmoji2 = Int(arc4random_uniform(UInt32(slotEmojis.count)))
        let randomEmoji3 = Int(arc4random_uniform(UInt32(slotEmojis.count)))
        
        
        //find a specific item in array
        //print(slotEmojis[randomEmoji1])
        
        //place emjois in labels
        label1.text = slotEmojis[randomEmoji1]
        label2.text = slotEmojis[randomEmoji2]
        label3.text = slotEmojis[randomEmoji3]
        
        //determine if all three labels are the same
        if label1.text == label2.text && label2.text == label3.text
        {
            //print("Winner winner, chicken dinner!")
        
            //add alert for win
            alert()
        }
        
    }
    
    func alert()
    {
        
        let myAlert = UIAlertController(title: "Jackpot", message: "You win $10000", preferredStyle: UIAlertControllerStyle.Alert)
        myAlert.addAction(UIAlertAction(title: "Play again?", style: UIAlertActionStyle.Default, handler: { sender in
            
            //inside a closure in the handler; doesn't know what's happening
            //outside of the {}
            //self tells it to look outside the view controller
            self.label1.text = self.slotEmojis[0]
            self.label2.text = self.slotEmojis[0]
            self.label3.text = self.slotEmojis[0]
        }))
        
        presentViewController(myAlert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

