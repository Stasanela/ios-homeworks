import UIKit

struct Post {
    let title: String
}

class PostViewController: UIViewController {
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = post?.title

        let infoButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(showInfo))
        navigationItem.rightBarButtonItem = infoButton
    }

    @objc func showInfo() {
        let infoViewController = InfoViewController()
        let navigationController = UINavigationController(rootViewController: infoViewController)
        present(navigationController, animated: true, completion: nil)
    }
}

