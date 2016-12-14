//
//  ViewController.swift
//  SwiftCustomFontDemo
//
//  Created by healthmanage on 16/12/14.
//  Copyright © 2016年 healthmanager. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dataArray = NSMutableArray()
    var textLabel = UILabel()
    var currentCellIndexP:NSIndexPath? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "系统字体"
        
        //获取所有字体
        for familyN in UIFont.familyNames {
            for fontT in UIFont.fontNames(forFamilyName: familyN) {
                self.dataArray.add(fontT)
            }
        }
        
        let myTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-150))
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.tableHeaderView = UIView.init()
        myTableView.tableFooterView = UIView.init()
        self.view.addSubview(myTableView)
        
        self.textLabel = UILabel.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.size.height-150, width: UIScreen.main.bounds.size.width, height: 150))
        self.textLabel.backgroundColor = UIColor.lightGray
        self.textLabel.text = "逝去的永远就失去了，追忆是一种残酷；有时候枉然，有时候也是一种解脱。有一点是要记牢的，爱的时候，绝对是真心诚意的相爱。"
        self.textLabel.numberOfLines = 0
        self.textLabel.textColor = UIColor.blue
        self.view.addSubview(self.textLabel)
        
    }
    //MARK:--------UITableViewDelegate,UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var myCell = tableView.cellForRow(at: indexPath)
        if myCell==nil {
            myCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell1")
        }
        
        myCell?.textLabel?.text = self.dataArray[indexPath.row] as? String
        myCell?.selectionStyle = .none
        return myCell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.currentCellIndexP != nil {
            let cell = tableView.cellForRow(at: self.currentCellIndexP as! IndexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.none
        }
        
        self.textLabel.font = UIFont.init(name: (self.dataArray[indexPath.row] as? String)!, size: 17)
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        
        self.currentCellIndexP = indexPath as NSIndexPath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

