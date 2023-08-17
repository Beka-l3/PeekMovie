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

final class LoginPage: UIViewController, Colors, Informatives {
    
    weak var presenter: LoginPagePresenter?
    private let viewComponents: LoginViewComponents
    private lazy var infoPopLabel: UILabel = { getInfoPop() }()
    private lazy var activityIndicator: UIActivityIndicatorView = { getActivityIndicator() }()
    
    init() {
        viewComponents = LoginViewComponents()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() { super.viewDidLoad()
        view.backgroundColor = black
        setupViews()
        viewComponents.usernameInput.delegate = self
        viewComponents.loginButton.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        viewComponents.registerButton.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        infoPopLabel.center = EPConstants.infoPopCenter
    }
    
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated)
        changeActivityIndicatorState(toActive: false)
    }
    
    private func setupViews() {
        let loginView = viewComponents.loginView
        view.addSubview(loginView)
        view.addSubview(infoPopLabel)
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: EPConstants.largePadding),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: EPConstants.padding),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -EPConstants.padding),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: EPConstants.largePadding),
        ])
    }
    
    @objc private func handleLoginButton() {
        changeActivityIndicatorState(toActive: true)
        let username = viewComponents.usernameInput.text ?? EPConstants.emptyText
        presenter?.checkUsername(with: username)
    }
    
    @objc private func handleRegisterButton() {
        presenter?.openRegisterPage()
    }
    
    func setInputFieldWith(with state: Bool) {
        let placeholder = state ? EPConstants.usernameInputPlaceholder : EPConstants.incorrectUsernameInputPlaceholder
        let color = state ? grey : UIColor.systemRed
        
        viewComponents.usernameInput.text = EPConstants.emptyText
        viewComponents.usernameInput.layer.borderColor = color.cgColor
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color])
        viewComponents.usernameInput.attributedPlaceholder = placeholderText
    }

    func popInfoLabel(type: InfoPopType, completion: @escaping () -> Void = {}) {
        changeActivityIndicatorState(toActive: false)
        var text: String
        var detail: String
        var infoType: InformativeType = .tip
        
        switch type {
        case .incorrectInput(input: .username):
            text = InfoPops.incorrectInput
            detail = InfoPops.checkUsername
            setInputFieldWith(with: false)
        case .connectionError:
            text = InfoPops.connectionError
            detail = InfoPops.tryLater
        case .serverError:
            text = InfoPops.serverError
            detail = InfoPops.tryLater
        default:
            text = InfoPops.internalError
            detail = InfoPops.waitUpdate
            infoType = .wrong
        }
        infoPopLabel.attributedText = getAttributedText(
            text: text,
            detail: detail,
            type: infoType
        )
        animateInfoPop(label: infoPopLabel, completion: completion)
    }
    
    func changeActivityIndicatorState(toActive: Bool) {
        if toActive { activityIndicator.startAnimating() }
        else { activityIndicator.stopAnimating() }
    }
}

extension LoginPage: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setInputFieldWith(with: true)
    }
}
