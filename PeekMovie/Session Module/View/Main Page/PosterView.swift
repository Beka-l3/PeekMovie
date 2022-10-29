//
//  PosterView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 24.10.2022.
//

import UIKit


protocol PosterViewDelegate: AnyObject {
    
}

class PosterViewPage: UIViewController, Colors {
    
    weak var presenter: PosterViewDelegate?
    private var posterViewModels: PosterViewModels
    
    init() {
        self.posterViewModels = PosterViewModels()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
//  MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = black
        setupViews()
        setGestureRecognizer()
        posterViewModels.infoButton.addTarget(self, action: #selector(handleInfoButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setPosterImageAnimation()
    }
    
//  MARK: - objc
    @objc func handlePressAndHold(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            posterViewModels.posterImage.layer.pauseLayer()
        } else if gesture.state == .ended {
            posterViewModels.posterImage.layer.resumeLayer()
        }
    }
    
    @objc func handleInfoButton() {
//        let opacity = posterViewModels.movieInfoView.scrollView.layer.opacity
        let anim = CABasicAnimation(keyPath: "opacity")
        anim.toValue = 1 - self.posterViewModels.darkFadeTop.opacity
        anim.duration = 0.8
        anim.fillMode = .forwards
        anim.isRemovedOnCompletion = false
        self.posterViewModels.darkFadeTop.add(anim, forKey: "opacityAnim")
        
        UIView.animate(withDuration: 0.8, delay: .zero, options: []) {
            self.posterViewModels.movieInfoView.scrollView.layer.opacity = 1 - self.posterViewModels.movieInfoView.scrollView.layer.opacity
            self.posterViewModels.infoButton.layer.opacity = 1.25 - self.posterViewModels.infoButton.layer.opacity
        } completion: { done in
            self.posterViewModels.darkFadeTop.opacity = 1 - self.posterViewModels.darkFadeTop.opacity
        }
    }
    
//  MARK: - func
    private func setupViews() {
        let posterView = posterViewModels.posterView
        view.addSubview(posterView)
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            posterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            posterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupLayers() {
//      MARK: FIX ME
        let posterViewSize = CGSize(width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
        posterViewModels.setupLayers(size: posterViewSize)
        posterViewModels.setData(frameSize: posterViewSize)
    }
    
    private func setGestureRecognizer() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handlePressAndHold))
        longPress.minimumPressDuration = 0.2
        view.addGestureRecognizer(longPress)
    }
    
    private func setPosterImageAnimation() {
        let posterViewSize = CGSize(width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
        let scale = posterViewSize.height / posterViewModels.posterImage.image!.size.height
        let newSize = CGSize(width: posterViewModels.posterImage.image!.size.width * scale, height: posterViewModels.posterImage.image!.size.height * scale)
        var offset: CGFloat = .zero
        var newOrigin: CGPoint = .zero
        
        if posterViewModels.posterImage.image!.size.width > posterViewSize.width {
            if posterViewModels.posterImage.frame.origin == .zero { offset = newSize.width - posterViewSize.width }
            newOrigin = CGPoint(x: -offset, y: .zero)
        } else {
            if posterViewModels.posterImage.frame.origin == .zero { offset = newSize.height - posterViewSize.height }
            newOrigin = CGPoint(x: .zero, y: -offset)
        }
        
        UIView.animate(withDuration: 12, delay: 1, options: [.repeat, .autoreverse]) { [weak self] in
            self?.posterViewModels.posterImage.frame.origin = newOrigin
        }
    }
}

