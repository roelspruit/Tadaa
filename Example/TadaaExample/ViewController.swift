//
//  ViewController.swift
//  TadaaExample
//
//  Created by Roel Spruit on 04/08/16.
//  Copyright © 2016 Dinkywonder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private tadaa = Tadaa()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tadaa.showDesignsForViewController(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

