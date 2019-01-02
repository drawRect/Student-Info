//
//  LoaderView.swift
//  Students
//
//  Created by Ranjith Kumar on 12/21/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    public var lblLoadingMessage: UILabel?

    private var indicator: UIActivityIndicatorView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = 70

        self.indicator?.frame = CGRect(x:self.bounds.width/2-size/2, y:self.bounds.height/2-size/2, width:size, height:50);

        self.lblLoadingMessage?.frame = CGRect(x:10, y:(self.indicator?.frame.maxY)!, width:self.bounds.width-20, height:25)
    }

    // MARK: - Private Functions
    private func createViews() {
        self.indicator = UIActivityIndicatorView.init(style: .whiteLarge)
        self.indicator?.color = UIColor.rgb(r: 50, g: 199, b: 242)
        self.indicator?.backgroundColor = .clear
        self.addSubview(self.indicator!)

        self.lblLoadingMessage = UILabel()
        self.lblLoadingMessage?.text = ""
        self.lblLoadingMessage?.textColor = .black
        self.lblLoadingMessage?.textAlignment = .center
        self.lblLoadingMessage?.font = .systemFont(ofSize: 14, weight: .regular)
        self.lblLoadingMessage?.backgroundColor = .clear
        self.lblLoadingMessage?.numberOfLines = 1
        self.addSubview(self.lblLoadingMessage!)

    }

    // MARK:: Public Functions
    public func startAnimatingLoader() {
        self.indicator?.startAnimating()
    }

    public func stopAnimatingLoader() {
        self.indicator?.stopAnimating()
    }

}

extension UIViewController {
    public func showLoadingViewWithMessage(message:String) {
        let loadingView = LoadingView.init(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        loadingView.backgroundColor = UIColor(hex: 0xFFFFFF, alpha: 0.5)
        if (UIApplication.shared.keyWindow?.subviews.contains(loadingView))! == false {
            UIApplication.shared.keyWindow?.addSubview(loadingView)
        }

        UIApplication.shared.keyWindow?.bringSubviewToFront(loadingView)

        if(message.isEmpty == false) {
            loadingView.lblLoadingMessage?.text = message
        }
        loadingView.startAnimatingLoader()
    }

    public func hideLoadingView() {
        DispatchQueue.main.async {
            // Safer zone to find the loading view and remove it from SuperView
            var found = false

            for subview in UIApplication.shared.keyWindow!.subviews {
                if subview is LoadingView {
                    found = true
                    subview.removeFromSuperview()
                    break
                }
            }
            if !found {
                debugPrint("self.loading does not containt any superview")
            }
        }
    }
}
