# MarginScrollView

[![CI Status](https://img.shields.io/travis/outofcoding/MarginScrollView.svg?style=flat)](https://travis-ci.org/outofcoding/MarginScrollView)
[![Version](https://img.shields.io/cocoapods/v/MarginScrollView.svg?style=flat)](https://cocoapods.org/pods/MarginScrollView)
[![License](https://img.shields.io/cocoapods/l/MarginScrollView.svg?style=flat)](https://cocoapods.org/pods/MarginScrollView)
[![Platform](https://img.shields.io/cocoapods/p/MarginScrollView.svg?style=flat)](https://cocoapods.org/pods/MarginScrollView)

## Screenshot

First View and Second View

![First](https://user-images.githubusercontent.com/34772312/83946622-fc2cd980-a84c-11ea-8ae3-bbc8882068e2.png)
![Second](https://user-images.githubusercontent.com/34772312/83946624-fdf69d00-a84c-11ea-9e4a-bba80cc9b739.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

and add your project.
import MarginScrollView and view create and set scrollView.item

```swift
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
```

## Properties
1. Align
set align enum value 
- top : Top Align
- center : Center Align
- bottom : Bottom Align

2. items
Set View Item

3. edgeInsets
MarginScrollView's edge Insets

4. decorate
inner item decorate. default is DefaultDecorate
```swift
public protocol Decorateable {
    var itemWidth: CGFloat { get }
    var itemSpacing: CGFloat { get }
}

public struct DefaultDecorate : Decorateable {
    public var itemWidth: CGFloat = UIScreen.main.bounds.width * 0.8
    public var itemSpacing: CGFloat = 15
}
```

## Requirements

## Installation

MarginScrollView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MarginScrollView'
```

## Author

outofcoding, outofcoding@gmail.com

## License

MarginScrollView is available under the MIT license. See the LICENSE file for more info.


