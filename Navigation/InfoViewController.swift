import UIKit
class InfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Info"

        let alertButton = UIButton(type: .system)
        alertButton.setTitle("Show Alert", for: .normal)
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        alertButton.center = view.center
        alertButton.frame = CGRect(x: view.center.x - 50, y: view.center.y, width: 100, height: 50)
        view.addSubview(alertButton)
    }

    @objc func showAlert() {
        let alertController = UIAlertController(title: "Alert", message: "This is an alert", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("OK Pressed")
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            print("Cancel Pressed")
        }))
        present(alertController, animated: true, completion: nil)
    }
}
