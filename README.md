# RealmDebugger

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

`RealmDebugger` is a lightweight iOS library that helps you debug your Realm database. It provides a convenient way to browse and inspect your Realm tables and records directly from your app.

https://github.com/meetAhmed/RealmDebugger/assets/42321000/f6acb740-506b-49c7-b46a-07158b86bd66

## Features

- Automatically present a view controller to browse and inspect Realm database tables when you shake a device.
- Supports manual invocation for presenting the debugger view.
- View records in each table by tapping on the table name.

## Installation

### Swift Package Manager

You can add `RealmDebugger` to your project using Swift Package Manager. 

1. In Xcode, go to `File > Swift Packages > Add Package Dependency`.
2. Enter the repository URL: `https://github.com/meetAhmed/RealmDebugger`.
3. Follow the prompts to complete the installation.

## Usage

### Automatic Presentation

By default, `RealmDebugger` can be configured to present the debugger view controller when the user shakes their device.

### Manual Presentation

You can also manually present the debugger view controller using one of the provided methods:

```swift
import RealmDebugger

// Present the debugger view
RealmDebugger.presentRealmDebuggerView()

// Present the debugger view with a specific root view controller
RealmDebugger.presentRealmDebuggerView(rootViewController: UINavigationController)

// Present the debugger view for a specific table
RealmDebugger.presentRealmDebuggerViewForTable(tableName: "YourTableName")
```

### Example

Here's an example of how you might integrate `RealmDebugger` in your app:

```swift
import SwiftUI
import RealmDebugger

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Realm Debugger Example")
                .padding()

            Button("Present Debugger View") {
                RealmDebugger.presentRealmDebuggerView()
            }
            .padding()
        }
    }
}
```

## Contributing

`RealmDebugger` is open source and contributions are welcome! Please feel free to submit pull requests or open issues to suggest features or report bugs.

### License

`RealmDebugger` is released under the MIT license. See [LICENSE](LICENSE) for details.

---

### Author

Created by [Ahmed](https://github.com/meetAhmed).

---

## Contact

For any questions or suggestions, feel free to contact the author via GitHub/Email/Linkedin.

---

Enjoy debugging your Realm database with `RealmDebugger`! 😊
