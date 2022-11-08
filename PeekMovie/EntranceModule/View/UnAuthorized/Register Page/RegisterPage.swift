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

class RegisterPage: UIViewController, Colors, Informatives {
    
    weak var presenter: RegisterPagePresenter?
    private var registerViewModels: RegisterPageViewModels
    private lazy var infoPopLabel: UILabel = { getInfoPop() }()
    private lazy var activityIndicator: UIActivityIndicatorView = { getActivityIndicator() }()
    
    init() {
        self.registerViewModels = RegisterPageViewModels()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() { super.viewDidLoad()
        view.backgroundColor = black
        setupViews()
        registerViewModels.usernameInput.delegate = self
        registerViewModels.emailInput.delegate = self
        registerViewModels.passwordInput.delegate = self
        registerViewModels.registerButton.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
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
        let registerView = registerViewModels.registerView
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
            username: registerViewModels.usernameInput.text ?? EPConstants.emptyText,
            email: registerViewModels.emailInput.text ?? EPConstants.emptyText,
            password: registerViewModels.passwordInput.text ?? EPConstants.emptyText
        )
        
        presenter?.checkRegistrationData(with: id)
    }
    
    func setInputFieldsStateForUsername(with state: Bool) {
        let placeholder = state ? EPConstants.usernameInputPlaceholder : EPConstants.incorrectUsernameInputPlaceholder
        let color = state ? grey : UIColor.systemRed
        
        registerViewModels.usernameInput.text = EPConstants.emptyText
        registerViewModels.usernameInput.layer.borderColor = color.cgColor
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color])
        registerViewModels.usernameInput.attributedPlaceholder = placeholderText
    }
    
    func setInputFieldsStateForPassword(with state: Bool) {
        let placeholder = state ? EPConstants.passwordInputPlaceholder : EPConstants.incorrectPasswordInputPlaceholder
        let color = state ? grey : UIColor.systemRed
        
        registerViewModels.passwordInput.text = EPConstants.emptyText
        registerViewModels.passwordInput.layer.borderColor = color.cgColor
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color])
        registerViewModels.passwordInput.attributedPlaceholder = placeholderText
    }
    
    func setInputFieldsStateForEmail(with state: Bool) {
        let placeholder = state ? EPConstants.emailInputPlaceholder : EPConstants.incorrectEmailInputPlaceholder
        let color = state ? grey : UIColor.systemRed
        
        registerViewModels.emailInput.text = EPConstants.emptyText
        registerViewModels.emailInput.layer.borderColor = color.cgColor
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color])
        registerViewModels.emailInput.attributedPlaceholder = placeholderText
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
