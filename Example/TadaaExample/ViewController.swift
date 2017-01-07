//
//  ViewController.swift
//  TadaaExample
//
//  Created by Roel Spruit on 04/08/16.
//  Copyright © 2016 Dinkywonder. All rights reserved.
//

import UIKit
import Tadaa

class ViewController: UIViewController {

    fileprivate let tadaa = Tadaa()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tadaa.showDesignsForViewController(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

