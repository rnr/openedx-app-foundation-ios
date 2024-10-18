# OEXFoundation Integration on iOS

**OEXFoundation** is a core library providing essential dependencies, extensions, utilities, and protocols for building plugins within the OpenEdX iOS ecosystem. This library allows developers to extend the functionality of OpenEdX by creating plugins that integrate seamlessly into the platform.

### Step 1: Installation
**OEXFoundation** is distributed exclusively via Swift Package Manager (SPM). To add it to your project:

**1. Using Xcode:**
- Go to **File > Add Packages...**
- Enter the repository URL for **OEXFoundation.**
- Choose the version you need (ensure it matches the version used in any plugins you include).
- Select Add Package.

**2. Using Package.swift:**
If you're using a Package.swift file, add OEXFoundation to your dependencies:
```swift
dependencies: [
    .package(url: "https://github.com/raccoongang/openedx-app-foundation-ios.git", from: "1.0.0")
],
```

### Step 2: Implement OEXFoundation Protocols
**OEXFoundation** provides protocols that you can implement to create your own plugins. For example, to implement an analytics service, you can conform to the ```AnalyticsService``` protocol defined in **OEXFoundation.**

Example:
```swift
import Foundation
import OEXFoundation

public class YourAnalyticsService: AnalyticsService {
    public init() {}

    public func identify(id: String, username: String?, email: String?) {
        // Your implementation here
    }

    public func logEvent(_ event: String, parameters: [String: Any]?) {
        // Your implementation here
    }

    public func logScreenEvent(_ event: String, parameters: [String: Any]?) {
        // Your implementation here
    }
}
```

### Step 3: Plugin Publishing
You can build and distribute your plugin as a Swift Package. This approach allows others to include your plugin in their projects easily. You can publish your plugin to:

- **Git Repositories:** GitHub, GitLab, Bitbucket, etc.
- **Swift Package Registries:** For broader distribution.

**Note:** Ensure that the version of **OEXFoundation** used in your plugin matches the version used in the main OpenEdX project to maintain compatibility.

### Step 4: Initialize Plugins in Your AppDelegate
After creating and adding your plugin to your project, initialize it in your AppDelegate and add it to the PluginManager.

```swift
import UIKit
import OEXFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let pluginManager = PluginManager()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        // Initialize your plugins
        initPlugins()

        // Other initialization code...
        return true
    }

    private func initPlugins() {
        // Add your analytics service plugin
        pluginManager.addPlugin(analyticsService: YourAnalyticsService())

        // Add other plugins if necessary
        // pluginManager.addPlugin(anotherService: YourOtherService())
    }
}
```

### Additional Notes
- **Version Consistency:** It's crucial to use the same version of **OEXFoundation** in both your main OpenEdX project and any plugins you create or include. Mismatched versions can lead to compatibility issues.
- **Importing OEXFoundation:** In your plugin's Swift Package, ensure you import **OEXFoundation** to access the necessary protocols and extensions.
```swift
import OEXFoundation
```

- **Extensions and Utilities: OEXFoundation** not only provides protocols but also includes a variety of extensions and utilities that can be useful across different modules of your project.
### Summary
By following these steps, you can effectively integrate **OEXFoundation** into your iOS project and develop plugins that enhance the OpenEdX platform. Whether you're implementing analytics services, custom features, or utilities, **OEXFoundation** provides a solid foundation for your development efforts.
