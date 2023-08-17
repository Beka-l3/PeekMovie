//
//  RegisterPage.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 14.10.2022.
//

import UIKit

protocol RegisterPagePresenter: AnyObject {
    func checkRegistrationData(with id: RegistrationFormDTO)
}

final class RegisterPage: UIViewController, ColorsOld, Informatives {
    
    weak var presenter: RegisterPagePresenter?
    private var viewComponents: RegisterPageViewComponents
    private lazy var infoPopLabel: UILabel = { getInfoPop() }()
    private lazy var activityIndicator: UIActivityIndicatorView = { getActivityIndicator() }()
    
    init() {
        self.viewComponents = RegisterPageViewComponents()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() { super.viewDidLoad()
        view.backgroundColor = black
        setupViews()
        viewComponents.usernameInput.delegate = self
        viewComponents.emailInput.delegate = self
        viewComponents.passwordInput.delegate = self
        viewComponents.registerButton.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = yellow
        infoPopLabel.center = EPConstants.infoPopCenter
    }
    
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated)
        changeActivityIndicatorState(toActive: false)
    }
    
    private func setupViews() {
        let registerView = viewComponents.registerView
        view.addSubview(registerView)
        view.addSubview(infoPopLabel)
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            registerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: EPConstants.smallPadding),
            registerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: EPConstants.padding),
            registerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -EPConstants.padding),
            registerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: EPConstants.padding)
        ])
    }
    
    @objc func handleRegisterButton() {
        changeActivityIndicatorState(toActive: true)
        let id = RegistrationFormDTO(
            username: viewComponents.usernameInput.text ?? EPConstants.emptyText,
            email: viewComponents.emailInput.text ?? EPConstants.emptyText,
            password: viewComponents.passwordInput.text ?? EPConstants.emptyText
        )
        
        presenter?.checkRegistrationData(with: id)
    }
    
    func setInputFieldsStateForUsername(with state: Bool) {
        if state && !(viewComponents.usernameInput.text?.isEmpty ?? true) { return }
        let placeholder = state ? EPConstants.usernameInputPlaceholder : EPConstants.incorrectUsernameInputPlaceholder
        let color = state ? grey : UIColor.systemRed
        
        viewComponents.usernameInput.text = EPConstants.emptyText
        viewComponents.usernameInput.layer.borderColor = color.cgColor
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color])
        viewComponents.usernameInput.attributedPlaceholder = placeholderText
    }
    
    func setInputFieldsStateForPassword(with state: Bool) {
        if state && !(viewComponents.passwordInput.text?.isEmpty ?? true) { return }
        let placeholder = state ? EPConstants.passwordInputPlaceholder : EPConstants.incorrectPasswordInputPlaceholder
        let color = state ? grey : UIColor.systemRed
        
        viewComponents.passwordInput.text = EPConstants.emptyText
        viewComponents.passwordInput.layer.borderColor = color.cgColor
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color])
        viewComponents.passwordInput.attributedPlaceholder = placeholderText
    }
    
    func setInputFieldsStateForEmail(with state: Bool) {
        if state && !(viewComponents.emailInput.text?.isEmpty ?? true) { return }
        let placeholder = state ? EPConstants.emailInputPlaceholder : EPConstants.incorrectEmailInputPlaceholder
        let color = state ? grey : UIColor.systemRed
        
        viewComponents.emailInput.text = EPConstants.emptyText
        viewComponents.emailInput.layer.borderColor = color.cgColor
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color])
        viewComponents.emailInput.attributedPlaceholder = placeholderText
    }
    
    func popInfoLabel(type: InfoPopType, completion: @escaping () -> Void = {}) {
        changeActivityIndicatorState(toActive: false)
        var text: String
        var detail: String
        var infoType: InformativeType = .tip
        
        switch type {
        case .incorrectInput(input: .username):
            text = InfoPops.incorrectInput
            detail = InfoPops.checkInputs
            setInputFieldsStateForUsername(with: false)
        case .incorrectInput(input: .email):
            text = InfoPops.incorrectInput
            detail = InfoPops.checkInputs
            setInputFieldsStateForEmail(with: false)
        case .incorrectInput(input: .password):
            text = InfoPops.incorrectInput
            detail = InfoPops.checkInputs
            setInputFieldsStateForPassword(with: false)
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

extension RegisterPage: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setInputFieldsStateForUsername(with: true)
        setInputFieldsStateForPassword(with: true)
        setInputFieldsStateForEmail(with: true)
    }
}
