//
//  ViewController.swift
//  MarginScrollView
//
//  Created by OutOfCode on 06/06/2020.
//  Copyright (c) 2020 outofcoding. All rights reserved.
//

import UIKit

import MarginScrollView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 100))
        view1.backgroundColor = .yellow
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 200))
        view2.backgroundColor = .red
        let view3 = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 300))
        view3.backgroundColor = .blue
        let view4 = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 70))
        view4.backgroundColor = .yellow
        let view5 = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 250))
        view5.backgroundColor = .red
        let view6 = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 100))
        view6.backgroundColor = .blue
        
        let scrollView = MarginScrollView()
        scrollView.backgroundColor = .black
        scrollView.align = .top
        view.addSubview(scrollView)
        
        scrollView.items = [view1, view2, view3, view4, view5, view6]
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
