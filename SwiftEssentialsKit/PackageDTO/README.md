# SwiftEssentialsKit/PackageDTO

This submodule includes a DTO to transfer data between controllers in a more structured way.

## Usage

Let's define a new controller extending `PKGViewController`. 
```swift
import SwiftEssentialsKit

class ExampleViewController: PKGViewController {
    
    private enum PackageKeys: String, Hashable {
        case text = "packageText"
    }
    
    private var text: String!
    
    static func package(text: String) -> Package {
        return Package()
            .put(key: PackageKeys.text, element: text)  // WARNING: PackageKeys.text and PackageKeys.text.rawValue do NOT produce the same hash codes.
                                                        // PLEASE DO NOT MIX THEM.
    }
    
    override func properties(from package: Package) {
        super.properties(from: package)
        
        text = package[PackageKeys.text] // WARNING: PackageKeys.text and PackageKeys.text.rawValue do NOT produce the same hash codes.
                                         // PLEASE DO NOT MIX THEM.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = text
    }
}
```

The parent is a subclass of `UIViewController`, that handles all the Package lifecycle.

The function `package(text:)` is a Static Factory Method that allows you to create a Package for ExampleViewController,
containing all the arguments required by the controller.

The function `properties(from:)` is a function aiming to assign all the properties of the controller.

Now let's add an extension of `ExampleViewController` implementing `PKGInstantiatableController` or `PKGInstantiatableStoryboard`.
The former is useful to create a controller from its constructor (from code); the latter is useful to create a controller declared in a Storyboard.

```swift
extension ExampleViewController: PKGInstantiatableStoryboard {
    static var storyboardSource: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    static var storyboardIdentifier: String = "ExampleViewControllerId"
}
```

```swift
extension ExampleViewController: PKGInstantiatableController {
    static func create() -> UIViewController & PKGControllerProtocol {
        return ExampleViewController()
    }
    
    // Optional, see doc for more.
    static var shouldWrapInNavigationController: Bool {
        return true
    }
    
    // Optional, see doc for more.
    static func configure(selfController: UIViewController) {
        selfController.modalPresentationStyle = .formSheet
    }
}
```

Now we are ready to build our `ExampleViewController`!

```swift
let package = ExampleViewController.package(text: "SOME")
present(ExampleViewController.instantiate(with: package), animated: true)
// or
navigationController?.pushViewController(ExampleViewController.instantiate(with: package), animated: true)
```
