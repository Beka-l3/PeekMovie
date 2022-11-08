//
//  PasswordPage.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.10.2022.
//

import UIKit


protocol PasswordPagePresenter: AnyObject {
    func checkPassword(with password: String)
}

class PasswordPage: UIViewController, Colors, Informatives {
    
    weak var presenter: PasswordPagePresenter?
    private let passwordViewModels: PasswordViewModels
    private lazy var infoPopLabel: UILabel = { getInfoPop() }()
    private lazy var activityIndicator: UIActivityIndicatorView = { getActivityIndicator() }()
    
    init() {
        passwordViewModels = PasswordViewModels()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() { super.viewDidLoad()
        view.backgroundColor = black
        setupViews()
        passwordViewModels.passwordInput.delegate = self
        passwordViewModels.continueButton.addTarget(self, action: #selector(handleContinueButton), for: .touchUpInside)
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
        let passwordView = passwordViewModels.passwordView
        view.addSubview(passwordView)
        view.addSubview(infoPopLabel)
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            passwordView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: EPConstants.smallPadding),
            passwordView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: EPConstants.padding),
            passwordView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -EPConstants.padding),
            passwordView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: EPConstants.padding),
        ])
    }
    
    @objc func handleContinueButton() {
        changeActivityIndicatorState(toActive: true)
        let password = passwordViewModels.passwordInput.text ?? EPConstants.emptyText
        presenter?.checkPassword(with: password)
    }
    
    func setInputFieldWith(with state: Bool) {
        let placeholder = state ? EPConstants.passwordInputPlaceholder : EPConstants.incorrectPasswordInputPlaceholder
        let color = state ? grey : UIColor.systemRed
        
        passwordViewModels.passwordInput.text = EPConstants.emptyText
        passwordViewModels.passwordInput.layer.borderColor = color.cgColor
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color])
        passwordViewModels.passwordInput.attributedPlaceholder = placeholderText
    }
    
    func popInfoLabel(type: InfoPopType, completion: @escaping () -> Void = {}) {
        changeActivityIndicatorState(toActive: false)
        var text: String
        var detail: String
        var infoType: InformativeType = .tip
        
        switch type {
        case .incorrectInput(input: .password):
            text = InfoPops.incorrectInput
            detail = InfoPops.checkPassword
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

extension PasswordPage: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setInputFieldWith(with: true)
    }
}
