//
//  MarginScrollView.swift
//  MarginScrollView
//
//  Created by OutOfCode on 2020/03/08.
//  Copyright © 2020 outofcode. All rights reserved.
//

import UIKit

public extension MarginScrollView {
    enum Align {
        case top
        case center
        case bottom
    }
}

public class MarginScrollView : UIScrollView {
    
    private lazy var scrollViewDelegate = MarginScrollViewDelegate()
    private lazy var mainView = UIView()
    
    // MARK: --
    
    public lazy var edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    public lazy var align = Align.top
    
    // MARK: --
    
    public var items: [UIView] = [] {
        willSet {
            draw(items: newValue)
        }
    }
    
    public var decorate: Decorateable {
        set { scrollViewDelegate.decorate = newValue }
        get { scrollViewDelegate.decorate }
    }
    
    // MARK: --
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        delegate = scrollViewDelegate
        decelerationRate = .init(0.99)
    }
    
    public convenience init(frame: CGRect, decorate: Decorateable) {
        self.init(frame: frame)
        scrollViewDelegate.decorate = decorate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var intrinsicContentSize: CGSize {
        return mainView.frame.size
    }
}

private extension MarginScrollView {
    
    func draw(items: [UIView]) {
        scrollViewDelegate.totalPage = items.count
        
        for subview in mainView.subviews {
            subview.removeFromSuperview()
        }
        
        mainView = UIView()
        mainView.backgroundColor = .clear
        
        var width = edgeInsets.left
        
        let firstItem = items.first
        
        let viewHeight = (items.max { (before, after) -> Bool in
            before.frame.size.height < after.frame.size.height
        }?.frame.size.height ?? 0.0) + edgeInsets.top + edgeInsets.bottom
        
        for item in items {
            if item != firstItem {
                width += decorate.itemSpacing
            }
            
            let point: CGPoint
            switch align {
            case .top:
                point = CGPoint(x: width, y: edgeInsets.top)
            case .bottom:
                point = CGPoint(x: width, y: viewHeight - item.frame.size.height - edgeInsets.bottom)
            case .center:
                point = CGPoint(x: width, y: (viewHeight / 2) - (item.frame.size.height / 2))
            }
            
            item.frame = CGRect(origin: point, size: item.frame.size)
            mainView.addSubview(item)
            width += item.frame.width
        }
        
        width += edgeInsets.right
        
        mainView.frame = CGRect(origin: .zero, size: CGSize(width: width, height: viewHeight))
        addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.leftAnchor.constraint(equalTo: leftAnchor),
            mainView.rightAnchor.constraint(equalTo: rightAnchor),
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
