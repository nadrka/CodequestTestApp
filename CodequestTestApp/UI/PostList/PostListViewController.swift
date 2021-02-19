//
//  PostViewModel.swift
//  CodequestTestApp
//
//  Created by karol.nadratowski on 19/02/2021.
//

import UIKit

final class PostTableViewController: UITableViewController {
    private var viewModel: PostListViewModel
    
    init(viewModel: PostListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reusableIdentifier)
        tableView.tableFooterView = UIView()
        
        bindViewModel()
        viewModel.fetchPosts()
    }
    
    private func bindViewModel() {
        viewModel.onPostLoaded = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
        
        viewModel.onFailure = { 
            print("error")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reusableIdentifier, for: indexPath) as! TableViewCell
    
        if let post = viewModel.getPost(for: indexPath.row) {
            cell.textLabel?.text = post.title
            cell.detailTextLabel?.text = post.body
        }
        
        return cell
    }
    
}


