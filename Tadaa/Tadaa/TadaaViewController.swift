//
//  TadaaViewController.swift
//  Tadaa
//
//  Created by Roel Spruit on 01/08/16.
//  Copyright © 2016 Dinkywonder. All rights reserved.
//

import UIKit

class TadaaViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let imgView = UIImageView()
    
    func initDesignDebugger() {
        UIApplication.sharedApplication().applicationSupportsShakeToEdit = true
    }
    
    internal override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    internal override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        super.motionEnded(motion, withEvent: event)
        
        if motion == .MotionShake {
            chooseDesignOverlay()
        }
    }
    
    private func chooseDesignOverlay() {
        
        guard let window = self.view.window else {
            return
        }
        
        if scrollView.superview == nil {
            // First time loading the scrollview
            
            scrollView.contentSize = window.bounds.size
            addGestures(scrollView)
            
            imgView.contentMode = UIViewContentMode.TopLeft
            scrollView.addSubview(imgView)
        }
        
        scrollView.frame = window.bounds
        scrollView.alpha = 0.5
        
        let imageName = String(Mirror(reflecting: self).subjectType)
        imgView.image = UIImage(named: "Tadaa-\(imageName)")
        imgView.frame = window.bounds
        
        window.addSubview(scrollView)
    }
    
}

extension TadaaViewController {
    
    private func addGestures(view: UIView) {
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(TadaaViewController.designDebuggerPan(_:)))
        panGesture.minimumNumberOfTouches = 3
        panGesture.maximumNumberOfTouches = 3
        view.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TadaaViewController.designDebuggerDoubleTap(_:)))
        tapGesture.numberOfTapsRequired = 3
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func designDebuggerDoubleTap(gesture: UITapGestureRecognizer) {
        gesture.view?.removeFromSuperview()
    }
    
    @objc private func designDebuggerPan(gesture: UIPanGestureRecognizer) {
        
        guard let gestureView = gesture.view else {
            return
        }
        
        let touchPoint = gesture.locationInView(gestureView)
        gestureView.alpha = touchPoint.x / gestureView.bounds.size.width
    }
}