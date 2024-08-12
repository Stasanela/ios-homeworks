import Foundation
import UIKit

class ProfileHeaderView: UIView {
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel ()
    private let statusLabel = UILabel ()
    private let button = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    func setupView () {
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.backgroundColor = .gray
        avatarImageView.layer.contents = UIImage(named: "Steve")?.cgImage
                
        nameLabel.text = "Steve Jobs"
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.textAlignment = .center
        
        statusLabel.text = "One more thing"
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        button.setTitle("Show status", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(button)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.frame = CGRect(
            x: 16,
            y: 16,
            width: 100,
            height: 100)
        nameLabel.frame = CGRect (
            x: 27,
            y: avatarImageView.frame.maxY + 10,
            width: bounds.width - 40,
            height: 30)
        statusLabel.frame = CGRect(
            x: 20,
            y:nameLabel.frame.maxY + 10,
            width: bounds.width - 40,
            height: 20)
        button.frame = CGRect(
            x: 16,
            y: statusLabel.frame.maxY + 20,
            width: 100,
            height: 40)
    }
    @objc func buttonPressed() {
        print(statusLabel.text ?? "No status")
    }
    }

    

