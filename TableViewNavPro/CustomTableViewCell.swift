//
//  CustomTableViewCell.swift
//  TableViewNavPro
//
//  Created by Ghassan  albakuaa  on 10/1/20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let reuseId: String = "CustomTableView"
    var rImagView: UIImageView?
    var iDLabel:UILabel?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    required init?(coder: NSCoder) {
        fatalError("init(code:) has been not implemented")
    }
    
    private func setUp() {
        let vStackView = UIStackView(frame: .zero)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.distribution = .fillEqually
        vStackView.axis = .vertical
        vStackView.alignment = .center
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "hat01")
        
        let idLabel = UILabel(frame: .zero)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.textAlignment = .right
        idLabel.text = "Bottom Label"
        idLabel.textColor = .red
       
        vStackView.addArrangedSubview(idLabel)
        self.contentView.addSubview(vStackView)
        self.contentView.addSubview(imageView)
        vStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        vStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        vStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        
        imageView.leadingAnchor.constraint(equalTo: vStackView.trailingAnchor, constant: 8).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -200).isActive = true
        imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -18).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        idLabel.leadingAnchor.constraint(equalTo: vStackView.trailingAnchor, constant: 8).isActive = true
        idLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -38).isActive = true
        idLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        idLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        idLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        idLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        self.iDLabel = idLabel
        self.rImagView = imageView
       
    }
}
