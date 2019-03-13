//
//  FirstViewController.swift
//  toDo
//
//  Created by Antonie on 2019/03/05.
//  Copyright © 2019 Antonie. All rights reserved.
//

import UIKit
var list = [String]()

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var noItemsAdded: UILabel!
    
    @IBOutlet weak var myTabeView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return(list.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            list.remove(at: indexPath.row)
            //Set the list again, so it refreshes without the deleted item.
            UserDefaults.standard.set(list, forKey: "list")
            checkEmptyArray()
            myTabeView.reloadData()
        }
    }
    
    func loadDefaults() {
        list = UserDefaults.standard.array(forKey: "list") as? [String] ?? []
    }
    
    func checkEmptyArray() {
        
        if(list.isEmpty) {
            noItemsAdded.text = "No Items added to your list yet"
            print(list)
        }
        else {
            noItemsAdded.text = ""
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkEmptyArray()
        myTabeView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaults()
        checkEmptyArray()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

