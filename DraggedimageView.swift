//
//  Draggedimage.swift
//  Kids Maths Game
//
//  Created by jc14ach on 21/02/2017.
//  Copyright © 2017 jc14ach. All rights reserved.
//

import UIKit


class DraggedImageView: UIImageView {
    
    
    var startLocation:CGPoint?
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        
        startLocation = touches.first?.locationInView(self)
        
        
        
    }
    
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        
        
        
        // Calculate offset
        
        let pt = touches.first?.locationInView(self)
        
        let dx = pt!.x - startLocation!.x
        
        let dy = pt!.y - startLocation!.y
        
        
        
        var newcenter = CGPoint(x: CGFloat(self.center.x + dx), y: CGFloat(self.center.y + dy))
        
        // Constrain movement into parent bounds
        
        let halfx = self.bounds.midX
        
        newcenter.x = max(halfx, newcenter.x)
        
        newcenter.x = min(self.superview!.bounds.size.width - halfx, newcenter.x)
        
        let halfy = self.bounds.midY
        
        newcenter.y = max(halfy + 290, newcenter.y)
        
        newcenter.y = min(self.superview!.bounds.size.height - halfy, newcenter.y)
        
        
        
        // Set new location
        
        self.center = newcenter
        
    }
}