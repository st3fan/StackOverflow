//
//  ViewController.swift
//  TrackingArea
//
//  Created by Stefan Arentz on 2015-03-09.
//  Copyright (c) 2015 Stefan Arentz. All rights reserved.
//

import Cocoa

enum ImagePosition {
    case Up, Down
}

class ViewController: NSViewController {

    let ImageHeightWhenDown: CGFloat = 16
    
    @IBOutlet weak var imageView: NSImageView!
    var trackingArea: NSTrackingArea!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = NSBundle.mainBundle().pathForImageResource("Image") {
            if let image = NSImage(contentsOfFile: path) {
                imageView.image = image
            }
        }
        
        view.removeConstraints(view.constraints)
        imageView.frame = frameForDrawerAtPosition(.Down)

        println(imageView.bounds)
        trackingArea = NSTrackingArea(rect: imageView.bounds, options: NSTrackingAreaOptions.ActiveInKeyWindow|NSTrackingAreaOptions.MouseEnteredAndExited, owner: self, userInfo: nil)
        imageView.addTrackingArea(trackingArea)
    }
    
    private func frameForDrawerAtPosition(position: ImagePosition) -> NSRect {
        var frame = imageView.frame
        switch position {
        case .Up:
            frame.origin.y = -1
            break
        case .Down:
            frame.origin.y = (-frame.size.height) + ImageHeightWhenDown
            break
        }
        return frame
    }
    
    override func mouseEntered(event: NSEvent) {
        NSAnimationContext.runAnimationGroup({ (context: NSAnimationContext!) in
            context.duration = 0.4
            self.imageView.animator().frame = self.frameForDrawerAtPosition(.Up)
        }, completionHandler: nil)
    }
    
    override func mouseExited(theEvent: NSEvent) {
        NSAnimationContext.runAnimationGroup({ (context: NSAnimationContext!) in
            context.duration = 0.4
            self.imageView.animator().frame = self.frameForDrawerAtPosition(.Down)
        }, completionHandler: nil)
    }
}
