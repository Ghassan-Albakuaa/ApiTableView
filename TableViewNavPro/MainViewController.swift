//
//  MainViewController.swift
//  TableViewNavPro
//
//  Created by Ghassan  albakuaa  on 10/1/20.
//

import UIKit
typealias ImageResult = (img: UIImage?, id: String?)
class MainViewController: UIViewController, UITableViewDelegate {

    var tableView: UITableView?
    var no = 10
    let manager: NetworkManager
    init(manager: NetworkManager = NetworkManager()) {
        self.manager = manager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.setUp()
    }
    
    private func setUp(){
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseId)
      
        self.view.addSubview(tableView)
        let top = tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8)
          let left = tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8)
          let right = tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
          let bottom = tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
          NSLayoutConstraint.activate([top, left, right, bottom])
       
        tableView.backgroundColor = .darkGray
        self.tableView = tableView
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.no
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseId, for: indexPath) as? CustomTableViewCell
        else {
            return UITableViewCell()
       
            }
        
        manager.fetchImage { (tuple: ImageResult) in
            DispatchQueue.main.async {
                cell.rImagView?.image = tuple.img
                cell.iDLabel?.text = (tuple.id)
                
            }
        }
      
        return cell
        }
    }
    

