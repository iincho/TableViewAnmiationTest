//
//  TextViewCellTableViewCell.swift
//  AnimationTest
//
//  Created by Yoichi on 2017/12/02.
//  Copyright © 2017年 Yoichi Motoyama. All rights reserved.
//

import UIKit

protocol TextViewCellTableViewCellDelegate: class {
  func didTapActionBtn(_ cell: TextViewCellTableViewCell)
}

class TextViewCellTableViewCell: UITableViewCell {

  @IBAction func tapActionBtn(_ sender: Any) {
    delegate?.didTapActionBtn(self)
  }
  
  // UITextViewを使う事でいい感じに
  @IBOutlet private weak var textView: UITextView!
  @IBOutlet private weak var actionBtn: UIButton!
  
  weak var delegate: TextViewCellTableViewCellDelegate?
  
  private let shortText = "ウィキペディア（英: Wikipedia）は、ウィキメディア財団が運営しているインターネット百科事典である"
  private let originalText = "ウィキペディア（英: Wikipedia）は、ウィキメディア財団が運営しているインターネット百科事典である。コピーレフトなライセンスのもと、サイトにアクセス可能な誰もが無料で自由に編集に参加できる。世界の各言語で展開されている。 「ウィキペディア（Wikipedia）」という名前は、ウェブブラウザ上でウェブページを編集することができる「ウィキ（Wiki）」というシステムを使用した「百科事典」（英: Encyclopedia）であることに由来する造語である。設立者の1人であるラリー・サンガーにより命名された。"
  
  private var isOpen = false
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    selectionStyle = .none
    textView.text = shortText + "..."
    textView.isEditable = false
    textView.textColor = UIColor.black
    textView.backgroundColor = UIColor.yellow
    textView.isUserInteractionEnabled = false
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func refresh() {
    isOpen = !isOpen
    textView.text = isOpen ? originalText : shortText + "..."
  }
}
