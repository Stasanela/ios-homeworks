import UIKit

class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //        registerForKeyboardNotifications()
    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        
        let logoImage = UIImageView(image: UIImage(named: "logo"))
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(logoImage)
        
        let emailTextField = UITextField()
        emailTextField.placeholder = "Email or phone"
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.cornerRadius = 10
        emailTextField.font = UIFont.systemFont(ofSize: 16)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(emailTextField)
        
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(passwordTextField)
        
        let loginButton = UIButton()
        loginButton.setTitle("Log in", for: .normal)
        loginButton.backgroundColor = UIColor(named: "VKBlue")
        loginButton.layer.cornerRadius = 10
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            logoImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            
            emailTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor,constant: 120),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    //    private func registerForKeyboardNotifications() {
    //        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    //        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    //    }
    //
    //    @objc func willShowKeyboard(_ notification: NSNotification) {
    //            let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
    //            scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    //    }
    //
    //    @objc func willHideKeyboard(_ notification: NSNotification) {
    //            scrollView.contentInset.bottom = 0.0
    //        }
}
