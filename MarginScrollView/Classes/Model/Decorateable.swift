//
//  Decorateable.swift
//  MarginScrollView
//
//  Created by OutOfCode on 2020/06/06.
//

import Foundation

public protocol Decorateable {
    var itemWidth: CGFloat { get }
    var itemSpacing: CGFloat { get }
}

public struct DefaultDecorate : Decorateable {
    public var itemWidth: CGFloat = UIScreen.main.bounds.width * 0.8
    public var itemSpacing: CGFloat = 15
}
