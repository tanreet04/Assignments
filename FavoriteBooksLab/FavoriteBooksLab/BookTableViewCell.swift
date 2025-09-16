//
//  BookTableViewCell.swift
//  FavoriteBooksLab
//
//  Created by Student on 25/08/25.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    

    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(book: Book){
        title.text = book.title
    }

}
