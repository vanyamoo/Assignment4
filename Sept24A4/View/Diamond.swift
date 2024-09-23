//
//  Diamond.swift
//  Set
//
//  Created by Vanya Mutafchieva on 28/04/2022.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        
        let leftPoint = CGPoint(x: 0, y: rect.midY)
        let topPoint = CGPoint(x: rect.midX, y: 0)
        let rightPoint = CGPoint(x: rect.maxX, y: rect.midY)
        let bottomPoint = CGPoint(x: rect.midX, y: rect.maxY)
        
        var p = Path()
        p.move(to: leftPoint)
        p.addLines([topPoint, rightPoint, bottomPoint, leftPoint])
        p.closeSubpath()
        
        return p
    }
}
