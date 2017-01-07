# Tadaa
Overlay your designs on top of your apps and check margins and other positioning elements of views.

## Installation
[CocoaPods](http://cocoapods.org/) is the recommended installation method.

```ruby
pod 'Tadaa'
```

## Usage
In your project, create a folder reference called "Designs". This folder should contain image files. For each ViewController that should have a design overlay, add an image with the name of the viewcontroller in it. For instance, "Tadaa-HomeViewController.png".

If you want overlay the design on the viewcontroller directly:

```swift
showDesignsForViewController(self)
```
While the design is showing, you scroll around with 2 fingers to change the transparency or triple-tap the design to hide it again.


## Running the example app
The example application uses cocoapods to install Tadaa. run 'pod install' in the root folder of the project to install the pod. Then open the workspace and run the app.

## License
Tadaa is licensed under the BSD license. See [LICENSE](LICENSE) for more info.
