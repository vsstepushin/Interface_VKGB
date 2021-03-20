//
//  AllFotoViewController.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 13.03.2021.
//

import UIKit

enum PanGestureDirection {
    case unknown
    case left
    case right
    case down
}

class AllFotoViewController: UIViewController {
    
    var albumUserFoto: [UIImage?] = []
    
    private weak var currentPhotoImageView: UIImageView!
    private weak var nextPhotoImageView: UIImageView!

    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var nextImageView: UIImageView!
    
    
    private let transformZero  = CGAffineTransform(scaleX: 0.0, y: 0.0)
    private let transformIncrease = CGAffineTransform(scaleX: 1.15, y: 1.15)
    private let transformDecrease = CGAffineTransform(scaleX: 1.0, y: 1.0)
    private let transformIdentity = CGAffineTransform.identity

    private var panGesture: UIPanGestureRecognizer!
    private var currentPanGestureDirection: PanGestureDirection = .unknown

    var selectedPhotoIndex: Int!
    
    var gestureAnimator = UIViewPropertyAnimator()
    
    private var nextPhotoIndex: Int {
        var photoIndex = 0
        if currentPanGestureDirection == .unknown || currentPanGestureDirection == .right {
            photoIndex = selectedPhotoIndex + 1
            photoIndex = min(photoIndex, albumUserFoto.count - 1)
        } else if currentPanGestureDirection == .left{
            photoIndex = selectedPhotoIndex - 1
            photoIndex = max(photoIndex, 0)
        }
        return photoIndex
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        firstImageView.image = albumUserFoto[selectedPhotoIndex]
        navigationItem.largeTitleDisplayMode = .never
        configureViewController()
    }
    
    private func configureViewController() {
        currentPhotoImageView = firstImageView
        nextPhotoImageView = nextImageView

        nextPhotoImageView.alpha = 0
        nextPhotoImageView.transform = transformZero

        currentPhotoImageView.image = albumUserFoto[selectedPhotoIndex]
        nextPhotoImageView.image = albumUserFoto[nextPhotoIndex]

        if albumUserFoto.count > 1 {
            panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
            panGesture.minimumNumberOfTouches = 1
            panGesture.maximumNumberOfTouches = 1
            currentPhotoImageView.addGestureRecognizer(panGesture)
        }
    }

    @objc private func handlePanGesture (_ recognazer: UIPanGestureRecognizer){
        switch recognazer.state {
        case .began:
            animatePhotoWithTransform(transformIncrease)
        case .changed:
            let translation = recognazer.translation(in: currentPhotoImageView)
            currentPanGestureDirection = translation.x > 0 ? .left : .right
            animatePhotoImageViewChanget(with: translation)
        case .ended:
            animatePhotoImageViewEnd()
        default: return
        }
    }

    private func animatePhotoWithTransform(_ transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.3) {
            self.currentPhotoImageView.transform = transform
        }
    }

    private func animatePhotoImageViewChanget (with translation: CGPoint) {
        currentPhotoImageView.transform = CGAffineTransform(translationX: translation.x, y: 0).concatenating(transformIncrease)
    }

    private func animatePhotoImageViewEnd() {
        if currentPanGestureDirection == .right {
            let isLast = selectedPhotoIndex == albumUserFoto.count - 1
            if currentPhotoImageView.frame.maxX < view.center.x && !isLast {
                animatePhotoSwipe()
            } else {
                animatePhotoWithTransform(transformIdentity)
            }
        } else if currentPanGestureDirection == .left {
            let isLast = selectedPhotoIndex == 0
            if currentPhotoImageView.frame.minX < view.center.x && !isLast {
                animatePhotoSwipe()
            } else {
                animatePhotoWithTransform(transformIdentity)
            }
        }
    }

    private func animatePhotoSwipe() {
        self.nextPhotoImageView.image = albumUserFoto[nextPhotoIndex]

        UIView.animate(withDuration: 0.6, animations: {
            self.currentPhotoImageView.alpha = 0
            self.nextPhotoImageView.alpha = 1
            self.nextPhotoImageView.transform = .identity
        }, completion: { finished in
            self.reconfigureImage()
        })
    }

    private func reconfigureImage() {
        selectedPhotoIndex = nextPhotoIndex

        currentPhotoImageView.transform = transformZero
        currentPhotoImageView.removeGestureRecognizer(panGesture)
        nextPhotoImageView.addGestureRecognizer(panGesture)

        if currentPhotoImageView == firstImageView {
            currentPhotoImageView = nextImageView
            nextPhotoImageView = firstImageView
        } else if currentPhotoImageView == nextImageView {
            currentPhotoImageView = firstImageView
            nextPhotoImageView = nextImageView
        }
    }
}
