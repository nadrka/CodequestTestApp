//
//  TableViewCell.swift
//  CodequestTestApp
//
//  Created by karol.nadratowski on 19/02/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let reusableIdentifier = "TableViewCellReusableId"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

