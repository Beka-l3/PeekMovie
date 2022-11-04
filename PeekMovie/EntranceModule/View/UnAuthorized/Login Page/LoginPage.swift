//
//  UnAuthorizedPage.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.10.2022.
//

import UIKit


protocol LoginPagePresenter: AnyObject {
    func checkUsername(with username: String)
    func openRegisterPage()
}

class LoginPage: UIViewController, Colors, Informatives {
    
    weak var presenter: LoginPagePresenter?
    private let loginViewModels: LoginViewModels
    private lazy var infoPopLabel: UILabel = { getInfoPop() }()
    
    init() {
        loginViewModels = LoginViewModels()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = black
        
        setupViews()
        loginViewModels.usernameInput.delegate = self
        loginViewModels.loginButton.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        loginViewModels.registerButton.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
        infoPopLabel.center = EPConstants.infoPopCenter
    }
    
    private func setupViews() {
        let loginView = loginViewModels.loginView
        view.addSubview(loginView)
        view.addSubview(infoPopLabel)
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: EPConstants.largePadding),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: EPConstants.padding),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -EPConstants.padding),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: EPConstants.largePadding),
        ])
    }
    
    @objc func handleLoginButton() {
        let username = loginViewModels.usernameInput.text ?? EPConstants.emptyText
        print(username)
        presenter?.checkUsername(with: username)
    }
    
    @objc func handleRegisterButton() {
        presenter?.openRegisterPage()
    }
    
    func setInputFieldWith(with state: Bool) {
        let placeholder = state ? EPConstants.usernameInputPlaceholder : EPConstants.incorrectUsernameInputPlaceholder
        let color = state ? grey : UIColor.systemRed
        
        loginViewModels.usernameInput.text = EPConstants.emptyText
        loginViewModels.usernameInput.layer.borderColor = color.cgColor
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color])
        loginViewModels.usernameInput.attributedPlaceholder = placeholderText
    }

    func popInfoLabel(type: InfoPopType) {
        infoPopLabel.attributedText = getAttributedText(
            text: "Try again!",
            detail: "Something went wrong.",
            type: .wrong
        )
        animateInfoPop(label: infoPopLabel)
    }
}


extension LoginPage: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setInputFieldWith(with: true)
    }
}
