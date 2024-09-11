import UIKit

class ProfileHeaderView: UIView {

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Steve")
        imageView.layer.borderWidth = 3
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    private let dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()

    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0.0
        button.isHidden = true
        return button
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Steve Jobs"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "One more thing"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        button.configuration = config
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Status", for: .normal)
        return button
    }()

    private var avatarOriginalFrame: CGRect = .zero

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        addTapGestureToAvatar()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
        addTapGestureToAvatar()
    }

    private func setupViews() {
        addSubview(dimmingView)
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dimmingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dimmingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dimmingView.topAnchor.constraint(equalTo: topAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: bottomAnchor),

            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),

            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),

            statusTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),

            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),

            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    private func addTapGestureToAvatar() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        avatarImageView.addGestureRecognizer(tapGesture)
    }

    @objc private func avatarTapped() {
        avatarOriginalFrame = avatarImageView.frame // Сохраняем исходное положение и размер аватара
        animateAvatarToCenter()
    }

    private func animateAvatarToCenter() {
        guard let superview = self.superview else { return }

        let screenWidth = superview.bounds.width
        let screenHeight = superview.bounds.height

        dimmingView.isHidden = false
        closeButton.isHidden = false

        let aspectRatio = avatarImageView.bounds.width / avatarImageView.bounds.height
        let newWidth = screenWidth
        let newHeight = newWidth / aspectRatio

        UIView.animate(withDuration: 0.5, animations: {
            self.dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            
            self.avatarImageView.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
            self.avatarImageView.transform = CGAffineTransform(scaleX: newWidth / self.avatarImageView.bounds.width, y: newHeight / self.avatarImageView.bounds.height)

        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1.0
            }
        }
    }

    @objc private func closeButtonTapped() {
        animateAvatarToOriginal()
    }

    private func animateAvatarToOriginal() {
        UIView.animate(withDuration: 0.3, animations: {
            self.closeButton.alpha = 0.0
        }) { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.0)

                self.avatarImageView.transform = .identity
                self.avatarImageView.frame = self.avatarOriginalFrame

            }) { _ in
                self.dimmingView.isHidden = true
                self.closeButton.isHidden = true
            }
        }
    }
}
