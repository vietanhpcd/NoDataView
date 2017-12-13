//
//  ViewController.swift
//  NoDataView
//
//  Created by Anhdzai on 12/12/17.
//  Copyright © 2017 Anhdzai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var array = ["lit1", "lit 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Tạo nút buttonitem Edit
        let leftEdit = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showEditing))
        // Hiển thi nút tại Left bar button item
        navigationItem.leftBarButtonItem = leftEdit
    }
    // Thực hiện hành động chuyển đổi khi kích Edit and Done
    @objc func showEditing() {
        navigationItem.leftBarButtonItem?.title = tableView.isEditing ? "Edit" : "Done"
        tableView.isEditing = tableView.isEditing ? false : true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataIndex", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    // Xoá dòng
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
        }
    }
    // Hiển thị thông báo khi xoá hết data
    func numberOfSections(in tableView: UITableView) -> Int {
        if array.count == 0 {
            let noDataIndex: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataIndex.text = "No Data Index"
            noDataIndex.textColor = UIColor.red
            noDataIndex.textAlignment = .center
            tableView.backgroundView = noDataIndex
            tableView.separatorStyle = .none
        }
        return 1
    }
}

