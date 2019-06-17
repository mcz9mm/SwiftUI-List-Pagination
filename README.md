# SwiftUI-List-Pagination
![platform](https://img.shields.io/badge/platform-ios-blue.svg) ![ios](https://img.shields.io/badge/ios-13.0%2B-blue.svg) ![swift](https://img.shields.io/badge/SwiftUI(beta)-orange.svg) ![Swift](https://img.shields.io/badge/Swift(beta)-5.1-brightgreen.svg) ![twitter](https://img.shields.io/badge/twitter-@mcz9mm-blue.svg)

This is a sample application of LIST that implements pagination with loading

## Requirement
- Xcode 11 beta
- iOS 13.0 beta
- SwiftUI

## Screenshot
![Jun-17-2019 09-23-52](https://user-images.githubusercontent.com/11751495/59571630-be85ec80-90e1-11e9-91c2-9339e9cab98a.gif)
![1](https://user-images.githubusercontent.com/11751495/59571682-381dda80-90e2-11e9-9929-06a8538e617c.jpg)

## Detail

### Loading View

use UIViewRepresentable

```swift
struct LoadingView: UIViewRepresentable {

    var isLoading: Bool

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(frame: .zero)
        indicator.style = .large
        indicator.hidesWhenStopped = true
        return indicator
    }

    func updateUIView(_ view: UIActivityIndicatorView, context: Context) {
        if self.isLoading {
            view.startAnimating()
        } else {
            view.stopAnimating()
        }
    }
}
```

LoadingRow

```
struct LoadingRow : View {
    @State var isLoading: Bool

    var body: some View {
        HStack {
            Spacer()
            LoadingView(isLoading: isLoading)
            Spacer()
        }
    }
}
```


## License
SwiftUI-List-Pagination is released the MIT license.
