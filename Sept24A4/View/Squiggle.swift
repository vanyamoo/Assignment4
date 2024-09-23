//
//  Squiggle.swift
//  Sept24A4
//
//  Created by Vanya Mutafchieva on 18/09/2024.
//

import SwiftUI

//- (UIBezierPath *)squigglePath {
//    CGRect bounds = CGRectMake(0.0, 0.0, self.bounds.size.width, self.bounds.size.height);
//    UIBezierPath *squigglePath = [[UIBezierPath alloc] init];
//    [squigglePath moveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.05, bounds.origin.y + bounds.size.height*0.40)];
//    
//    [squigglePath addCurveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.35, bounds.origin.y + bounds.size.height*0.25)
//                    controlPoint1:CGPointMake(bounds.origin.x + bounds.size.width*0.09, bounds.origin.y + bounds.size.height*0.15)
//                    controlPoint2:CGPointMake(bounds.origin.x + bounds.size.width*0.18, bounds.origin.y + bounds.size.height*0.10)];
//    
//    [squigglePath addCurveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.75, bounds.origin.y + bounds.size.height*0.30)
//                    controlPoint1:CGPointMake(bounds.origin.x + bounds.size.width*0.40, bounds.origin.y + bounds.size.height*0.30)
//                    controlPoint2:CGPointMake(bounds.origin.x + bounds.size.width*0.60, bounds.origin.y + bounds.size.height*0.45)];
//    
//    [squigglePath addCurveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.97, bounds.origin.y + bounds.size.height*0.35)
//                    controlPoint1:CGPointMake(bounds.origin.x + bounds.size.width*0.87, bounds.origin.y + bounds.size.height*0.15)
//                    controlPoint2:CGPointMake(bounds.origin.x + bounds.size.width*0.98, bounds.origin.y + bounds.size.height*0.00)];
//    
//    [squigglePath addCurveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.45, bounds.origin.y + bounds.size.height*0.85)
//                    controlPoint1:CGPointMake(bounds.origin.x + bounds.size.width*0.95, bounds.origin.y + bounds.size.height*1.10)
//                    controlPoint2:CGPointMake(bounds.origin.x + bounds.size.width*0.50, bounds.origin.y + bounds.size.height*0.95)];
//    
//    [squigglePath addCurveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.25, bounds.origin.y + bounds.size.height*0.85)
//                    controlPoint1:CGPointMake(bounds.origin.x + bounds.size.width*0.40, bounds.origin.y + bounds.size.height*0.80)
//                    controlPoint2:CGPointMake(bounds.origin.x + bounds.size.width*0.35, bounds.origin.y + bounds.size.height*0.75)];
//    
//    [squigglePath addCurveToPoint:CGPointMake(bounds.origin.x + bounds.size.width*0.05, bounds.origin.y + bounds.size.height*0.40)
//                    controlPoint1:CGPointMake(bounds.origin.x + bounds.size.width*0.00, bounds.origin.y + bounds.size.height*1.10)
//                    controlPoint2:CGPointMake(bounds.origin.x + bounds.size.width*0.005, bounds.origin.y + bounds.size.height*0.60)];
//    
//    [squigglePath closePath];
//    return squigglePath;
//}
//
//- (UIBezierPath *)ovalPath {
//    CGRect bounds = CGRectMake(0.0 + SHAPE_OFFSET, 0.0 + SHAPE_OFFSET, self.bounds.size.width - SHAPE_OFFSET*2, self.bounds.size.height - SHAPE_OFFSET*2);
//    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect:bounds];
//    return ovalPath;
//}
//
//- (UIBezierPath *)diamondPath {
//    UIBezierPath *diamondPath = [[UIBezierPath alloc] init];
//    [diamondPath moveToPoint:CGPointMake(self.bounds.size.width/2, SHAPE_OFFSET)];
//    [diamondPath addLineToPoint:CGPointMake(self.bounds.size.width - SHAPE_OFFSET, self.bounds.size.height/2)];
//    [diamondPath addLineToPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height - SHAPE_OFFSET)];
//    [diamondPath addLineToPoint:CGPointMake(SHAPE_OFFSET, self.bounds.size.height/2)];
//    [diamondPath closePath];
//    return diamondPath;
//}
