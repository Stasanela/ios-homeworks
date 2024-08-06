import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }

    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()

        let feedNavigationController = createNavigationController(
            viewController: FeedViewController(),
            title: "Feed",
            imageName: "list.bullet"
        )

        let profileNavigationController = createNavigationController(
            viewController: ProfileViewController(),
            title: "Profile",
            imageName: "person.crop.circle"
        )

        tabBarController.viewControllers = [feedNavigationController, profileNavigationController]

        return tabBarController
    }

    func createNavigationController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: imageName)
        viewController.navigationItem.title = title
        return navigationController
    }
}
