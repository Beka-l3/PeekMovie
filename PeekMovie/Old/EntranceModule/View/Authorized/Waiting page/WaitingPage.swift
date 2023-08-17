//
//  WaitingPage.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.10.2022.
//

import UIKit


protocol WaitingRoomPresenter: AnyObject {
    func cancelWaiting(didAdminClose: Bool)
    func startTheSession()
    func getIsAdmin() -> Bool
    func getRoomMembers() -> [String]
}

final class WaitingPage: UIViewController, Colors, Informatives {
    
    weak var presenter: WaitingRoomPresenter?
    
    private var viewComponents: WaitingRoomViewComponents
    private lazy var center: CGPoint = {
        CGPoint(x: view.center.x - EPConstants.padding, y: view.center.y * 1.4)
    }()
    
    private var animations = {}
    private lazy var infoPopLabel: UILabel = {getInfoPop()}()
    private lazy var activityIndicator: UIActivityIndicatorView = { getActivityIndicator() }()
    
//    MARK: - lifecycle
    init() {
        self.viewComponents = WaitingRoomViewComponents()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() { super.viewDidLoad()
        view.backgroundColor = black
        
        setupViews()
        viewComponents.usersPickerView.delegate = self
        viewComponents.usersPickerView.dataSource = self
        viewComponents.startButton.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
        viewComponents.cancelButton.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        viewComponents.setCenterForStartButton(at: center)
        viewComponents.startAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        infoPopLabel.center = EPConstants.infoPopCenter
        viewComponents.usersPickerView.reloadAllComponents()
    }
    
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated)
        changeActivityIndicatorState(toActive: false)
    }
    
//    MARK: - func
    private func setupViews() {
        let waitingView = viewComponents.waitingView
        view.addSubview(waitingView)
        view.addSubview(infoPopLabel)
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            waitingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            waitingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: EPConstants.padding),
            waitingView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -EPConstants.padding),
            waitingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -EPConstants.padding),
        ])
    }
    
    @objc func handleCancelButton() {
        presenter?.cancelWaiting(didAdminClose: false)
    }
    
    @objc func handleStartButton() {
        presenter?.startTheSession()
    }
    
}

extension WaitingPage {
    
    func setInitialData(roomData: RoomDTO, isAdmin: Bool) {
        viewComponents.roomIDLabel.text = roomData.roomId
        viewComponents.startButton.isHidden = !isAdmin
        viewComponents.secondLogoImage.isHidden = isAdmin
    }
    
    func popInfoLabel(type: InfoPopType, completion: @escaping () -> Void = {}) {
        changeActivityIndicatorState(toActive: false)
        var text = ""
        var detail = ""
        var infoType: InformativeType = .tip
        
        switch type {
        case .roomCreated:
            text = InfoPops.roomCreated
            detail = InfoPops.youAreAdmin
        case .roomStart:
            presenter?.startTheSession()
        case .adminOut:
            presenter?.cancelWaiting(didAdminClose: true)
        case .userJoin(let username):
            text = InfoPops.welcome + username
            detail = InfoPops.userJoined
            viewComponents.usersPickerView.reloadAllComponents()
            viewComponents.usersPickerView.selectRow((presenter?.getRoomMembers().count ?? 1) - 1, inComponent: .zero, animated: true)
        case .userLeft(let username):
            text = InfoPops.goodbye + username
            detail = InfoPops.userQuit
            viewComponents.usersPickerView.reloadAllComponents()
            viewComponents.usersPickerView.selectRow(.zero, inComponent: .zero, animated: true)
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
