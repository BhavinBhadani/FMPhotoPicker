//
//  FMPhotoPickerMoreCollectionViewCell.swift
//  FMPhotoPicker
//
//  Created by Bhavin Bhadani on 20/02/24.
//  Copyright © 2024 Cong Nguyen. All rights reserved.
//

import Foundation
import UIKit

class FMPhotoPickerMoreCollectionViewCell: UICollectionViewCell {
    static let reuseId = String(describing: FMPhotoPickerMoreCollectionViewCell.self)
    
    weak var imageView: UIImageView!
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.clipsToBounds = true
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_plus", in: .current, compatibleWith: nil)
        self.imageView = imageView
        imageView.contentMode = .center
        
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
        ])
    }
}
