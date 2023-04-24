# Coordinator-Based Navigation in Swift

This project demonstrates the use of the Coordinator pattern to manage navigation in a Swift application. It includes a basic setup with an `AppCoordinator` and `HomeFlowCoordinator`, each managing different flows within the app.

## Features

- AppCoordinator for managing the overall app navigation
- HomeFlowCoordinator for managing navigation within the home tab
- Supports multiple child coordinators
- Customizable and extensible design

## Installation

1. Clone the repository:
2. Open the project in Xcode:
3. Build and run the project on your preferred simulator or iOS device.

## Usage

The project includes the following main components:

### AppCoordinator

The `AppCoordinator` is responsible for managing the overall app navigation. It has a `start` function that takes an `AppStartType` to determine which flow to start with (e.g., Splash, LoginFlow, or HomeFlow). It also has support for deep links via the `DeepLinkOption` enum.

### HomeFlowCoordinator

The `HomeFlowCoordinator` is responsible for managing navigation within the home tab. It starts with a `UITabBarController` and sets up two child coordinators, `Tab1Coordinator` and `Tab2Coordinator`. These child coordinators manage the navigation within their respective tabs.

### Delegates

Both the `AppCoordinator` and `HomeFlowCoordinator` use delegate protocols to communicate back to their parent coordinators when their flows are completed. This allows the parent coordinator to manage the removal and cleanup of child coordinators.

## Contributing

Feel free to open issues, suggest improvements or submit pull requests. Contributions are more than welcome!


