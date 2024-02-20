//
//  FMPhotoPickerHeaderView.swift
//  FMPhotoPicker
//
//  Created by Bhavin Bhadani on 20/02/24.
//  Copyright © 2024 Cong Nguyen. All rights reserved.
//

import Foundation
import UIKit

class FMPhotoPickerHeaderView: UICollectionReusableView {
    static let reuseId = String(describing: FMPhotoPickerHeaderView.self)
    
    weak var containerView: UIView!
    weak var contentLabel: UILabel!
    weak var manageButton: UIButton!
    
    private var config: FMPhotoPickerConfig?
    public var onTapManage = {}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with config: FMPhotoPickerConfig) {
        self.config = config
        setupView()
    }
    
    private func setupView() {
        guard let config = config else { return }
        self.backgroundColor = .clear
        
        let containerView = UIView()
        self.containerView = containerView
        containerView.clipsToBounds = true
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.rightAnchor.constraint(equalTo: self.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: self.leftAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        let contentLabel = UILabel()
        contentLabel.font = config.manageTitleLabelFont
        contentLabel.textColor = config.manageTitleLabelTextColor
        contentLabel.text = config.strings["picker_permission_manage_label"]
        contentLabel.numberOfLines = 2
        self.contentLabel = contentLabel
        containerView.addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            contentLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        let manageButton = UIButton()
        manageButton.layer.cornerRadius = 15
        manageButton.layer.masksToBounds = true
        manageButton.layer.borderWidth = 1
        manageButton.layer.borderColor = config.manageButtonBorderColor.cgColor
        manageButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        manageButton.setTitle(config.strings["picker_permission_button_manage"], for: .normal)
        manageButton.titleLabel?.font = config.manageButtonFont
        manageButton.setTitleColor(config.manageButtonTextColor, for: .normal)
        manageButton.setContentHuggingPriority(.required, for: .horizontal)
        manageButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.manageButton = manageButton
        manageButton.addTarget(self, action: #selector(onTapManageButton(_:)), for: .touchUpInside)
        
        containerView.addSubview(manageButton)
        manageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            manageButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            manageButton.leftAnchor.constraint(equalTo: contentLabel.rightAnchor, constant: 16),
            manageButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16),
            manageButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    @IBAction func onTapManageButton(_ sender: Any) {
        self.onTapManage()
    }
    
}
