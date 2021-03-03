//
//  VKView.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 01.02.2021.
//

import UIKit

class AvaView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
        layer.borderWidth = 4
//        layer.borderColor = UIColor.lightGray.cgColor
        clipsToBounds = true
    }
}
extension CGColor {
    var UIColor: UIKit.UIColor {
        return UIKit.UIColor(cgColor: self)
    }
}
extension AvaView {
    
   /// Радиус гараницы
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue  }
        get { return layer.cornerRadius }
    }
    /// Толщина границы
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
//    / Цвет границы
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor  }
        get { return layer.borderColor?.UIColor }
    }
    /// Отсекание по границе
    @IBInspectable var _clipsToBounds: Bool {
        set { clipsToBounds = newValue }
        get { return clipsToBounds }
    }
}



class ShadowView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
//        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = 4.5
        layer.shadowOpacity = 12
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = false
    }
}
extension ShadowView {
    
    /// Смещение тени
    @IBInspectable var shadowOffset: CGSize {
        set { layer.shadowOffset = newValue  }
        get { return layer.shadowOffset }
    }
    /// Прозрачность тени
    @IBInspectable var shadowOpacity: Float {
        set { layer.shadowOpacity = newValue }
        get { return layer.shadowOpacity }
    }
    /// Радиус блура тени
    @IBInspectable var shadowRadius: CGFloat {
        set {  layer.shadowRadius = newValue }
        get { return layer.shadowRadius }
    }
    /// Цвет тени
    @IBInspectable var shadowColor: UIColor? {
        set { layer.shadowColor = newValue?.cgColor }
        get { return layer.shadowColor?.UIColor }
    }
    /// Отсекание по границе
    @IBInspectable var _clipsToBounds: Bool {
        set { clipsToBounds = newValue }
        get { return clipsToBounds }
    }
}
    class PhotoView: UIImageView {

        override func awakeFromNib() {
            super.awakeFromNib()
            layer.cornerRadius = 10
            layer.borderWidth = 3
            layer.borderColor = UIColor.blue.cgColor
        }
}
