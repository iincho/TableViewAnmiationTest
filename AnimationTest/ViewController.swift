//
//  ViewController.swift
//  AnimationTest
//
//  Created by Yoichi on 2017/12/02.
//  Copyright © 2017年 Yoichi Motoyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet private weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self

    let nib = UINib(nibName: "TextViewCellTableViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: "textViewCell")
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 20
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell: TextViewCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "textViewCell", for: indexPath) as? TextViewCellTableViewCell {
      cell.delegate = self
      return cell
    }
    return tableView.dequeueReusableCell(withIdentifier: "textViewCell", for: indexPath)
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell: TextViewCellTableViewCell = tableView.cellForRow(at: indexPath) as? TextViewCellTableViewCell {
      tableView.beginUpdates()
      UIView.animate(withDuration: 0.5, animations: {
        cell.refresh()
        cell.contentView.layoutIfNeeded()
      })
      tableView.endUpdates()
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
}

extension ViewController: TextViewCellTableViewCellDelegate {
  func didTapActionBtn(_ cell: TextViewCellTableViewCell) {
    tableView.beginUpdates()
    UIView.animate(withDuration: 0.5, animations: {
      cell.refresh()
      cell.contentView.layoutIfNeeded()
    })
    tableView.endUpdates()
  }
}
