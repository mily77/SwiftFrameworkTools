//
//  PickerTableViewCell.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/6.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxSwift

class PickerTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var orderNubLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    
    private(set) var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
