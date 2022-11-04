//
//  WaitingPage.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.10.2022.
//

import UIKit


protocol WaitingRoomPresenter: AnyObject {
    func cancelWaiting(isAdmin: Bool)
    func startTheSession(with roomId: String)
}

class WaitingPage: UIViewController, Colors, Informatives {
    
    weak var presenter: WaitingRoomPresenter?
    private var isAdmin: Bool
    private var waitingViewModels: WaitingRoomViewModels
    private lazy var center: CGPoint = {
        CGPoint(x: view.center.x - EPConstants.padding, y: view.center.y * 1.4)
    }()
    private var animations = {}
    private lazy var infoPopLabel: UILabel = {getInfoPop()}()
    
    init() {
        self.isAdmin = false
        self.waitingViewModels = WaitingRoomViewModels()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() { super.viewDidLoad()
        view.backgroundColor = black
        
        setupViews()
        waitingViewModels.startButton.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
        waitingViewModels.cancelButton.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        waitingViewModels.setCenterForStartButton(at: center)
        waitingViewModels.startAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        infoPopLabel.center = EPConstants.infoPopCenter
    }
    
    private func setupViews() {
        let waitingView = waitingViewModels.waitingView
        view.addSubview(waitingView)
        view.addSubview(infoPopLabel)
        NSLayoutConstraint.activate([
            waitingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            waitingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: EPConstants.padding),
            waitingView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -EPConstants.padding),
            waitingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -EPConstants.padding),
        ])
    }
    
    @objc func handleCancelButton() {
        presenter?.cancelWaiting(isAdmin: isAdmin)
    }
    
    @objc func handleStartButton() {
        let roomId = "H2EN84"

        presenter?.startTheSession(with: roomId)
    }
    
    func setInitialData(roomId: String, isAdmin: Bool) {
        self.isAdmin = isAdmin
        waitingViewModels.startButton.isHidden = !isAdmin
        waitingViewModels.secondLogoImage.isHidden = isAdmin
    }
    
    func startTheSession() {
        print("Start the session")
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
