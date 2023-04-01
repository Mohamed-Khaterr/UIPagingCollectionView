# UIPagingCollectionView

<!-- Project Settings -->
![Swift: Version](https://img.shields.io/badge/Swift-5.5-lightgray?logo=Swift)
![iOS: Version](https://img.shields.io/badge/iOS-13.0+-lightgray) 

<video width=800 autoplay loop>
    <source src="demo/demo.mov" type="video/mov">
</video>

<!-- Project bref -->
A Paging CollectionView built by adding collection views to paging collection view allowing the user to switch between any kind of collection view with an easy tap or swipe gesture similar to Twitter and Instagram use.

UIPagingCollectionView uses compositional layout, the buttons in the top with line under selected button are UIPagingCollectionView section header, and each cell width and height equal to pagingCollectionView width and height, and using paging scrolling.



<!-- ---------------------------------------------------------------------------- -->
## Table of Contents
 - [Features In](#features-in)
 - [Requirements](#requirements)
 - [Installation](#installation)
 - [How to use UIPagingCollectionView](#how-to-user-uipagingcollectionview)



<!-- ---------------------------------------------------------------------------- -->
## Features In
- [See](https://github.com/Mohamed-Khaterr/See)


<!-- ---------------------------------------------------------------------------- -->
## Requirements
- Swift 5.5+
- iOS 13+



<!-- ---------------------------------------------------------------------------- -->
## Installation
<!-- ### CocoaPods -->
### Manual
Add `UIPagingCollectionView.swift` and `UIPagingHeaderCollectionReusableView` to your project


## How to use UIPagingCollectionView

**You can user UIPagingCollectionView with Storyboard or Programmaticly**

### Using Storyboard
1. Add UICollectionView to ViewController
2. Select the CollectionView widget and set the class to point to UIPagingCollectionView
3. Create an outlet for UIPagingCollectionView in ViewController

```swift
IBOutlet var pagingCollectionView: UIPagingCollectionView!
```


### Programmaticly
1. Just instantiate a pagingCollectionView property
```swift
let pagingCollectionView = UIPaingCollectionView()
```



```swift
// Set Delegate to get current display collection view
pagingCollectionView.pagingDelegate = self


// Set DataSource to tell uipaging collection view how many collection view you want to display
pagingCollectionView.pagingDataSource = self
```


And this is the `DataSource` functions:

```swift
UIPagingCollectionViewDataSource:

// In titleForHeaderButtons you will need to set a titles for each button in header of uipagingCollectionview in sequence
func pagingCollectionView(titleForHeaderButtons pagingCollectionView: UIPagingCollectionView) -> [String] {
    return ["First", "Second", "Third"]
}


// In subCollectionViewsIn you will need to set collectionViews for pages you want in sequence with header titles
func pagingCollectionView(subCollectionViews pagingCollectionView: UIPagingCollectionView) -> [UICollectionView] {
    return [firstCollectionView, secondCollectionView, thirdCollectionView]
}
```


And this is the `Delegate` function:

```swift
UIPagingCollectionViewDelegate:

// This function will call when user scroll horizontaly to different collectionview or when user pressed on the header buttons
func pagingCollectionView(didScrollToCollectionViewAt index: Int) {
    print("Selected UICollectionView Index:", index)
}
```

That is it!


Now you can create collectionviews with different layouts in one view controller and each collectionview has it's content to display with it's properties and functions.