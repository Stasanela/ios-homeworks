import UIKit

class ProfileHeaderView: UIView {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Steve")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.text = "Steve Jobs"
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "One more thing"
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize (width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(button)
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let safeArea = self.safeAreaInsets
        
        let imageSize: CGFloat = 100
        imageView.frame = CGRect(
            x: 16,
            y: 16 + safeArea.top,
            width: imageSize,
            height: imageSize)
        imageView.layer.cornerRadius = imageSize / 2
        
        nameLabel.frame = CGRect(
            x: imageView.frame.maxX + 27,
            y: 27 + safeArea.top,
            width: bounds.width - imageView.frame.maxX - 43,
            height: 20)
        
        statusLabel.frame = CGRect(
            x: imageView.frame.maxX + 27,
            y: nameLabel.frame.maxY + 8,
            width: bounds.width - imageView.frame.maxX - 43,
            height: 20)
        
        let buttonHeight: CGFloat = 50
        let buttonWidth = bounds.width - 32
        button.frame = CGRect(
            x: 16,
            y: imageView.frame.maxY + 16,
            width: buttonWidth,
            height: buttonHeight)
    }
    
    @objc func buttonPressed() {
        print(statusLabel.text ?? "No status" )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
