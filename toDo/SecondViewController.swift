//
//  SecondViewController.swift
//  toDo
//
//  Created by Antonie on 2019/03/05.
//  Copyright © 2019 Antonie. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    
    @IBAction func addItem(_ sender: UIButton) {
        
            if (input.text != "")
            {
                let item: String = input.text!
                print("I'm holding \(item)")
                list.append(item)
                
                //Store item to array
                UserDefaults.standard.set(input.text, forKey: "list")
                UserDefaults.standard.synchronize()
                input.text = ""
                UserDefaults.standard.set(list, forKey: "list")
            }
            else {
                
                let alert = UIAlertController(title: "Whoops", message: "Ensure you have typed an item before clicking the add to list button.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
        }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print(UserDefaults.standard.dictionaryRepresentation())
        
//        let AddedTasks = UserDefaults.standard.object(forKey: "AddedTask")
//        if let AddedTask = AddedTasks as? String {
//         input.text = AddedTask
//         list.append(input.text!)
        }
    }
