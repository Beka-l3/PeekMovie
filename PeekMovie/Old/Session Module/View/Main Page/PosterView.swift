//
//  PosterView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 24.10.2022.
//

import UIKit


protocol PosterViewDelegate: AnyObject {
    func getMovie()
    func likeMovie()
    func dislikeMovie()
}

class PosterViewPage: UIViewController, ColorsOld, Informatives {
    
    weak var presenter: PosterViewDelegate?
    private var posterViewModels: PosterViewModels
    private var posterViewSize: CGSize { get { CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height) } }
    private lazy var infoPopLabel: UILabel = {getInfoPop()}()
    private lazy var activityIndicator: UIActivityIndicatorView = { getActivityIndicator() }()
    
    init() {
        self.posterViewModels = PosterViewModels()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
//  MARK: - lifecycle
    override func viewDidLoad() { super.viewDidLoad()
        view.backgroundColor = black
        setupViews()
        setGestureRecognizer()
        posterViewModels.infoButton.addTarget(self, action: #selector(handleInfoButton), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        infoPopLabel.center = EPConstants.infoPopCenter
    }
    override func viewWillLayoutSubviews() { super.viewWillLayoutSubviews()
        setupLayers()
    }
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated)
        presenter?.getMovie()
        posterViewModels.animatePosterImage(size: posterViewSize)
    }
    
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated)
        changeActivityIndicatorState(toActive: false)
    }
    
//  MARK: - objc
    @objc func handlePressAndHold(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began { posterViewModels.posterImage.layer.pauseLayer() }
        else if gesture.state == .ended { posterViewModels.posterImage.layer.resumeLayer() }
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        if gesture.state == .ended {
            if gesture.direction == .left { likeMovie() }
            else if gesture.direction == .right { dislikeMovie() }
        }
    }
    
    @objc func handleInfoButton() {
        let anim = CABasicAnimation(keyPath: "opacity")
        anim.toValue = 1 - self.posterViewModels.darkFadeTop.opacity
        anim.duration = 0.8
        anim.fillMode = .forwards
        anim.isRemovedOnCompletion = false
        self.posterViewModels.darkFadeTop.add(anim, forKey: "opacityAnim")
        
        UIView.animate(withDuration: 0.8, delay: .zero, options: []) { [weak self] in
            guard let self = self else {return}
            self.posterViewModels.movieRatingLabel.layer.opacity = 1 - self.posterViewModels.movieRatingLabel.layer.opacity
            self.posterViewModels.movieInfoView.scrollView.layer.opacity = 1 - self.posterViewModels.movieInfoView.scrollView.layer.opacity
            self.posterViewModels.infoButton.layer.opacity = 1.25 - self.posterViewModels.infoButton.layer.opacity
        } completion: { [weak self] done in
            guard let self = self else {return}
            self.posterViewModels.darkFadeTop.opacity = 1 - self.posterViewModels.darkFadeTop.opacity
        }
    }
    
//  MARK: - func
    private func setupViews() {
        let posterView = posterViewModels.posterView
        view.addSubview(posterView)
        view.addSubview(infoPopLabel)
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            posterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            posterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupLayers() {
        changeActivityIndicatorState(toActive: true)
        posterViewModels.setupLayers(size: posterViewSize)
    }
    
    private func likeMovie() {
        changeActivityIndicatorState(toActive: true)
        animateSwipe(didLike: true, completion: presenter?.likeMovie ?? setDummyMovieData)
    }
    
    private func dislikeMovie() {
        changeActivityIndicatorState(toActive: true)
        animateSwipe(didLike: false, completion: presenter?.dislikeMovie ?? setDummyMovieData)
    }
    
    private func setGestureRecognizer() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handlePressAndHold))
        longPress.minimumPressDuration = .zero
        posterViewModels.receiver.addGestureRecognizer(longPress)
        
        let rightSwipe = UISwipeGestureRecognizer (target: self, action: #selector(handleSwipe))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer (target: self, action: #selector(handleSwipe))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
    }
    
    private func animateSwipe(didLike: Bool, completion: @escaping () -> Void) {
        let fade = didLike ? self.posterViewModels.likeFade : self.posterViewModels.disLikeFade
        let label = didLike ? self.posterViewModels.likeLabel : self.posterViewModels.disLikeLabel
        let initialOrigin = fade.frame.origin
        fade.opacity = 1
        
        UIView.animate(withDuration: 0.8, delay: 0, options: [.curveEaseInOut]) {
            fade.frame.origin = .zero
            label.layer.opacity = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut]) {
                fade.opacity = 0
                label.layer.opacity = 0
            } completion: { _ in
                fade.frame.origin = initialOrigin
            }
            completion()
        }
    }
    
    func setNewMovieData(newMovie: MovieDTO) {
        posterViewModels.setData(size: posterViewSize, movie: newMovie)
        posterViewModels.movieInfoView.scrollView.setContentOffset(.zero, animated: true)
    }
    
    func setDummyMovieData() {
        changeActivityIndicatorState(toActive: false)
        setDummyPosterImage()
    }
    
    func setPosterImage(img: UIImage) {
        changeActivityIndicatorState(toActive: false)
        posterViewModels.setPosterImage(img: img)
        posterViewModels.animatePosterImage(size: posterViewSize)
    }
    
    func setDummyPosterImage() {
        changeActivityIndicatorState(toActive: false)
    }
    
    func popInfoLabel(type: InfoPopType, completion: @escaping () -> Void = {}) {
        changeActivityIndicatorState(toActive: false)
        var text = ""
        var detail = ""
        var infoType: InformativeType = .tip
        
        switch type {
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
