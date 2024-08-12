import UIKit

class FeedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let postButton = UIButton(type: .system)
        postButton.setTitle("Show Post", for: .normal)
        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        postButton.center = view.center
        postButton.frame = CGRect(x: view.center.x - 50, y: view.center.y, width: 100, height: 50)
        view.addSubview(postButton)
    }

    @objc func showPost() {
        let post = Post(title: "Sample Post")
        let postViewController = PostViewController()
        postViewController.post = post
        navigationController?.pushViewController(postViewController, animated: true)
    }
}

