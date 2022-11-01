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
    
    private var movies = Movies()
    
    weak var presenter: PosterViewDelegate?
    private var posterViewModels: PosterViewModels
    private var posterViewSize: CGSize { get { CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height) } }
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
    }
    override func viewWillLayoutSubviews() { super.viewWillLayoutSubviews()
        setupLayers()
    }
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated)
        posterViewModels.animatePosterImage(size: posterViewSize)
    }
    
//  MARK: - objc
    @objc func handlePressAndHold(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began { posterViewModels.posterImage.layer.pauseLayer() }
        else if gesture.state == .ended { posterViewModels.posterImage.layer.resumeLayer() }
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        if gesture.state == .ended {
            if gesture.direction == .left { animateSwipe(fade: self.posterViewModels.likeFade, label: self.posterViewModels.likeLabel) }
            else if gesture.direction == .right { animateSwipe(fade: self.posterViewModels.disLikeFade, label: self.posterViewModels.disLikeLabel) }
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
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            posterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            posterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupLayers() {
        posterViewModels.setupLayers(size: posterViewSize)
        posterViewModels.setData(size: posterViewSize, movie: movies.getMovie())
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
    
    private func animateSwipe(fade: CAGradientLayer, label: UILabel) {
        let initialOrigin = fade.frame.origin
        fade.opacity = 1
        UIView.animate(withDuration: 0.8, delay: 0, options: [.curveEaseInOut]) {
            fade.frame.origin = .zero
            label.layer.opacity = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut]) {
                fade.opacity = 0
                label.layer.opacity = 0
            } completion: { [weak self] done in
                fade.frame.origin = initialOrigin
                
                guard let self = self else {return}
                if done {self.posterViewModels.setData(size: self.posterViewSize, movie: self.movies.getMovie(), animate: true)}
                self.posterViewModels.movieInfoView.scrollView.setContentOffset(.zero, animated: true)
            }
        }
        movies.increase()
    }
}
