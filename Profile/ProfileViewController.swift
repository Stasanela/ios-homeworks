import Foundation
import UIKit

class ProfileViewController: UIViewController {
    private let profileHeaderView = ProfileHeaderView ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(profileHeaderView)
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let headerView = view.subviews.first as? ProfileHeaderView {
            headerView.frame = view.bounds
        }
    }
}
