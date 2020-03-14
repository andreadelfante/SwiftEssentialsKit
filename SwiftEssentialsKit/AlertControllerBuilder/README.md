# SwiftEssentialsKit/AlertControllerBuilder

This module includes a convenient way to create AlertController in chaining mode.

## Usage

```swift
import SwiftEssentialsKit

AlertControllerBuilder.alert
            .title("TITLE")
            .message("MESSAGE")
            .addAction(defaultType: "OK")
            .show(in: self)
```

```swift
import SwiftEssentialsKit

AlertControllerBuilder.alert
            .title("TITLE")
            .message("MESSAGE")
            .add(textField: "KEY")
            .addAction(defaultType: "OK", validate: { (values) -> Bool in
                return !(values["KEY"] ?? "").isEmpty
            }, handler: { (action, values) in
                // Perform action on tap
            })
            .addAction(destructiveType: "DELETE")
            .addAction(cancelType: "CANCEL")
            .show(in: self)
```
