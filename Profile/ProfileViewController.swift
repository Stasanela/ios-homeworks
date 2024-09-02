import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupProfileHeaderView()
        setupCustomButton()
    }
    
    private func setupProfileHeaderView() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderView)
        
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    private func setupCustomButton() {
        let customButton = UIButton(type: .system)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        customButton.configuration = config
        customButton.translatesAutoresizingMaskIntoConstraints = false
        customButton.setTitle("New Button", for: .normal)
        view.addSubview(customButton)
        
        NSLayoutConstraint.activate([
            customButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            customButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
