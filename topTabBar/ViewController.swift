//
//  ViewController.swift
//  topTabBar
//
//  Created by Ragaie alfy on 8/27/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var ToptabBarOutlet: TopTabBar!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       ToptabBarOutlet.buttonTitle = ["home","info","gallary","menu"]
        
       // ToptabBarOutlet.buttonImges = [UIImage.init(named: "house.png")!,UIImage.init(named: "house.png")!,UIImage.init(named: "house.png")!,UIImage.init(named: "house.png")!,UIImage.init(named: "house.png")!]
        
      //  ToptabBarOutlet.buttonImgesHighLight = [UIImage.init(named: "house-h.png")!,UIImage.init(named: "house-h.png")!,UIImage.init(named: "house-h.png")!,UIImage.init(named: "house-h.png")!,UIImage.init(named: "house-h.png")!]
        
        var viewController1 = self.storyboard?.instantiateViewController(withIdentifier: "1")
        var viewController2 = self.storyboard?.instantiateViewController(withIdentifier: "2")
        var viewController3 = self.storyboard?.instantiateViewController(withIdentifier: "3")
        var viewController4 = self.storyboard?.instantiateViewController(withIdentifier: "4")
        
        /// add array of controller to TopTabBar
        ToptabBarOutlet.dataSourceItem = [viewController1!,viewController2!,viewController3!,viewController4!]
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

