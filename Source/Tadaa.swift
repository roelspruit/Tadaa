//
//  TadaaViewController.swift
//  Tadaa
//
//  Created by Roel Spruit on 01/08/16.
//  Copyright © 2016 Dinkywonder. All rights reserved.
//

import UIKit

public class Tadaa {
    
    private let scrollView = UIScrollView()
    private let imgView = UIImageView()
    private var viewControllerName: String?
    
    var designDirectory = "Designs"
    
    init(designDirectory dir: String = "Designs") {
        designDirectory = dir
        setupViews()
    }
    
    private func designsForViewController() throws -> [UIImage] {
        guard let controllerName = viewControllerName else {
            return []
        }
        
        var files = [String]()
        let designsPath = NSBundle.mainBundle().bundlePath.stringByAppendingString("/\(designDirectory)")
        
        files = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(designsPath)
        
        let images: [UIImage] = files.filter({$0.containsString(controllerName)})
                .map({ designsPath.stringByAppendingString("/\($0)")})
                .flatMap({UIImage(contentsOfFile: $0)})
        
        return images
    }
    
    public func showDesignsForViewController(viewController: UIViewController) {
        viewControllerName = String(Mirror(reflecting: viewController).subjectType)
        
        var designs = [UIImage]()
        
        do {
            designs = try designsForViewController()
        }catch {
            NSLog("Tadaa: cannot find designs for given ViewController, is your designpath correct?")
        }
        
        if let firstImage = designs.first {
            show(firstImage)
        }
    }
    
    private func show(image: UIImage) {
        
        guard let window = UIApplication.sharedApplication().keyWindow else {
            return
        }
        
        imgView.image = image
        imgView.frame = window.bounds
        
        scrollView.contentSize = image.size
        scrollView.alpha = 0.7
        scrollView.frame = window.bounds
        window.addSubview(scrollView)
    }
    
    private func hideDesign() {
        scrollView.removeFromSuperview()
    }
    
    private func setupViews() {
        addControlGestures()
        imgView.contentMode = UIViewContentMode.TopLeft
        scrollView.addSubview(imgView)
    }
    
}

extension Tadaa {
    
    private func addControlGestures() {
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(Tadaa.panGesture(_:)))
        panGesture.minimumNumberOfTouches = 2
        panGesture.maximumNumberOfTouches = 2
        scrollView.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(Tadaa.doubleTapGesture(_:)))
        tapGesture.numberOfTapsRequired = 3
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func doubleTapGesture(gesture: UITapGestureRecognizer) {
        hideDesign()
    }
    
    @objc private func panGesture(gesture: UIPanGestureRecognizer) {
        
        guard let gestureView = gesture.view else {
            return
        }
        
        let touchPoint = gesture.locationInView(gestureView)
        gestureView.alpha = touchPoint.x / gestureView.bounds.size.width
    }
}