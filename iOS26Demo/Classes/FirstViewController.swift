//
//  FirstViewController.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/1/13.
//

import UIKit
import SwiftUI

class FirstViewController: UIViewController {

    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self

        tableView.backgroundColor = .white
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0;
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        // iOS26新增
//        tableView.bottomEdgeEffect.style = .automatic
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
    }
    
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        tabBarController?.tabBar.isHidden = true
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        tabBarController?.tabBar.isHidden = false
//    }


}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))!
        cell.textLabel?.text = "-------------------\(indexPath.row)"
        cell.detailTextLabel?.text = "-------------------\(indexPath.row)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
//        let vc = UIHostingController(rootView: ProfileViewSwiftUI(userId: "110110\(indexPath.row)", onClose: {
//            self.navigationController?.popViewController(animated: true)
//        }))
        
//        navigationController?.pushViewController(vc, animated: true)
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
}

