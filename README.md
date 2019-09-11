# viper-ios-tutorial
This is a first review of VIPER Architecture on iOS using swift 4

Install Templates from [here](https://github.com/infinum/iOS-VIPER-Xcode-Templates) for easy creation of the more common files.

The project queries information from [JSONPlaceholder](https://jsonplaceholder.typicode.com) for the list of users, when selecting one of the user the application navigate to the next screen retrieving the selected user album's and the rest of the information for the user. When selecting one of the user's album, we retrieve a list of "pictures" and displays them on a UICollectionView.

Next step is to implement [RxSwift](https://github.com/ReactiveX/RxSwift) or any other sort of Reactive Programming library.

More info about VIPER Architecture here: 

* [Architecting iOS Apps with VIPER (Objective-C)](https://www.objc.io/issues/13-architecture/viper/)
* [The ultimate VIPER architecture tutorial](https://theswiftdev.com/2018/03/12/the-ultimate-viper-architecture-tutorial/)
* [iOS Project Architecture: Using VIPER](https://cheesecakelabs.com/blog/ios-project-architecture-using-viper/)
