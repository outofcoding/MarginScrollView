//
//  MarginScrollViewDelegate.swift
//  MarginScrollView
//
//  Created by OutOfCode on 2020/03/08.
//  Copyright © 2020 outofcode. All rights reserved.
//

import UIKit

final class MarginScrollViewDelegate : NSObject {
    
    lazy var currentPage: Int = 0
    lazy var totalPage: Int = 0
    lazy var decorate: Decorateable = DefaultDecorate()
}

extension MarginScrollViewDelegate : UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth = scrollView.contentSize.width / totalPage.toFloat
        let targetXContentOffset = CGFloat(targetContentOffset.pointee.x)
        let newPage: Int
        
        if velocity.x == 0 {
            newPage = Int(floor((targetXContentOffset - pageWidth / 2) / pageWidth) + 1.0)
        } else {
            let targetPage = velocity.x > 0 ? currentPage + 1 : currentPage - 1
            newPage = min(max(0, targetPage), totalPage - 1)
        }
        
        let point: CGPoint
        if newPage == 0 {
            point = CGPoint(x: 0, y: 0)
        } else {
            point = CGPoint(x: targetContentX(scrollView, index: newPage), y: targetContentOffset.pointee.y)
        }
        
        targetContentOffset.pointee = point
        
        currentPage = newPage
    }
}

private extension MarginScrollViewDelegate {
    
    func indexOfContentOffset(_ scrollView: UIScrollView) -> Int {
        let index = nearbyint(scrollView.contentOffset.x / scrollView.contentSize.width)
        return min(max(0, index), (totalPage - 1).toFloat).toInt
    }
    
    func targetContentX(_ scrollView: UIScrollView, index: Int) -> CGFloat {
        let leftEdge = (scrollView as? MarginScrollView)?.edgeInsets.left ?? 0
        let contentPosition = (decorate.itemWidth * index.toFloat) + (decorate.itemSpacing * index.toFloat)
        let remain = (scrollView.frame.size.width - decorate.itemWidth) / 2
        return leftEdge + contentPosition - remain
    }
}
