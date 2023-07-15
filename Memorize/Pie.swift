//
//  Pie.swift
//  Memorize
//
//  Created by Alexandra Harley on 7/15/23.
//

import SwiftUI

struct Pie: Shape {
    // made as vars to be able to configure/animate
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        
        var p = Path()
        // drawing instructions go here
        p.move(to: center) // start in the center
        p.addLine(to: start) // draw a line out to the top of the circle
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startAngle,
                 endAngle: endAngle,
                 clockwise: !clockwise) // clockwise is upside down, so we invert it here to apply what we normally know clockwise as
        p.addLine(to: center)
        return p
    }
    
    
}
