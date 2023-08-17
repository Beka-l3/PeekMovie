//
//  ViewController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 10.10.2022.
//

import UIKit

protocol AuthorizedPagePresenter: AnyObject {
    func createRoom()
    func joinRoom(with roomId: String)
    func logOut()
}

final class AuthorizedPage: UIViewController, ColorsOld, Informatives {

    weak var presenter: AuthorizedPagePresenter?
    var isAdminOut: Bool
    private let viewComponents: AuthorizedPageViewComponents
    private lazy var infoPopLabel: UILabel = { getInfoPop() }()
    private lazy var activityIndicator: UIActivityIndicatorView = { getActivityIndicator() }()
    
    init() {
        self.isAdminOut = false
        self.viewComponents = AuthorizedPageViewComponents()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() { super.viewDidLoad()
        view.backgroundColor = black
        setupViews()
        viewComponents.roomIdInput.delegate = self
        viewComponents.joinButton.addTarget(self, action: #selector(handleJoinButton), for: .touchUpInside)
        viewComponents.createButton.addTarget(self, action: #selector(handleCreateButton), for: .touchUpInside)
        viewComponents.logOutButton.addTarget(self, action: #selector(handleLogOutButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        infoPopLabel.center = EPConstants.infoPopCenter
        viewComponents.updateViews()
    }
    
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated)
        if isAdminOut {
            DispatchQueue.global().async { sleep(1)
                DispatchQueue.main.async { [weak self] in self?.popInfoLabel(type: .adminOut) }
            }
            isAdminOut = false
        }
    }

    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated)
        changeActivityIndicatorState(toActive: false)
    }
    
    private func setupViews() {
        let joinView = viewComponents.joinRoomView
        view.addSubview(joinView)
        view.addSubview(infoPopLabel)
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            joinView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: EPConstants.smallPadding),
            joinView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: EPConstants.padding),
            joinView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -EPConstants.padding),
            joinView.bottomAnchor.constraint(equalTo: viewComponents.createButton.bottomAnchor),
        ])
    }
    
    @objc func handleLogOutButton() {
        changeActivityIndicatorState(toActive: true)
        presenter?.logOut()
    }
    
    @objc func handleJoinButton() {
        changeActivityIndicatorState(toActive: true)
        presenter?.joinRoom(with: viewComponents.roomIdInput.text ?? EPConstants.emptyText)
    }
    
    @objc func handleCreateButton() {
        changeActivityIndicatorState(toActive: true)
        presenter?.createRoom()
    }
    
    func setInputFieldWith(with state: Bool) {
        let placeholder = state ? EPConstants.roomIdIntupPlaceholder : EPConstants.incorrectRoomIdIntupPlaceholder
        let color = state ? grey : UIColor.systemRed
        
        viewComponents.roomIdInput.text = EPConstants.emptyText
        viewComponents.roomIdInput.layer.borderColor = color.cgColor
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color])
        viewComponents.roomIdInput.attributedPlaceholder = placeholderText
    }
    
    func popInfoLabel(type: InfoPopType, completion: @escaping () -> Void = {}) {
        changeActivityIndicatorState(toActive: false)
        var text: String
        var detail: String
        var infoType: InformativeType = .tip
        
        switch type {
        case .adminOut:
            text = InfoPops.roomClosed
            detail = InfoPops.adminClosed
        case .incorrectInput(input: .roomId):
            text = InfoPops.incorrectInput
            detail = InfoPops.checkRoomId
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

extension AuthorizedPage: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setInputFieldWith(with: true)
    }
}
