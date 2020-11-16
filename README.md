
# Investment Calculator

A simple iOS app that lets you simulate an investment

## Architecture

The app is built on **Clean MVVM-C** architecture while separating the `UI Components` and the `Networking` layers into separate modules.

This achitectural design was inspired by Uncle Bob's [Clean Swift Architecture](https://clean-swift.com/) and ajusted to make the application layer "architecture agnostic" so it could be implemented in MVVM, MVP, MVC etc.

### Prerequisites

```
Xcode 12.0.1
iOS 11.*
```

### Installing

Run:
```
pod install
```

And open:
```
InvestmentCalculator.xcworkspace
```

## Running the tests

CMD + U

## Built With

* [RxSwift](https://github.com/ReactiveX/RxSwift) - FRP framework
* [Quick/Nimble](https://github.com/Quick/Nimble) - Unit test framework
* [KIF](https://github.com/kif-framework/KIF) - Functional testing framework

## Authors

* **Tiago Leme** - [github](https://github.com/tfleme) - [linkedin](https://www.linkedin.com/in/tiagoleme/)
