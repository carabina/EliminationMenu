//
//  ViewController.swift
//  RGEliminationMenu
//
//  Created by Roman Gille on 14.04.16.
//  Copyright © 2016 Roman Gille. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eliminationMenu: RGEliminationMenu!
    @IBOutlet weak var infoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the menu created in interface builder.
        
        eliminationMenu.items = [
            MenuItem(title: "First", value: "SomeValue"),
            MenuItem(title: "Second", value: "SomeOtherValue"),
            MenuItem(title: "Third", value: "This could also be an Image"),
            MenuItem(title: "Fourth", value: "...or a view")
        ]
        
        eliminationMenu.selectionHandler = {item in
            let menuItem = item as! MenuItem
            
            self.infoLabel.text = "Selected item:\n\"\(menuItem.title)\"\n\nThe value is:\n\"\(menuItem.value)\""
        }
        
        // Create nemu in code.
        
        let rightMenu = RGEliminationMenu()
        
        rightMenu.items = [
            MenuItem(title: "First on the right", value: "SomeValue"),
            MenuItem(title: "Second", value: "SomeOtherValue"),
            MenuItem(title: "Third", value: "This could also be an Image"),
            MenuItem(title: "Fourth", value: "...or some other class")
        ]
        
        rightMenu.selectionHandler = {item in
            let menuItem = item as! MenuItem
            
            self.infoLabel.text = "Selected item:\n\"\(menuItem.title)\",\n\nThe value is:\n\"\(menuItem.value)\""
        }
        
        rightMenu.align = .Right
        
        // Add menu to layout.
        
        rightMenu.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rightMenu)
        
        view.addConstraints([
            NSLayoutConstraint(item: view, attribute: .RightMargin, relatedBy: .Equal, toItem: rightMenu, attribute: .Right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: view, attribute: .BottomMargin, relatedBy: .Equal, toItem: rightMenu, attribute: .Bottom, multiplier: 1, constant: 20)
            ])
        
        view.setNeedsUpdateConstraints()
        view.updateConstraintsIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

