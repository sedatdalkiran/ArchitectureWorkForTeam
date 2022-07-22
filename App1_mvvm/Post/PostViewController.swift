//
//  PostViewController.swift
//  App1_mvvm
//
//  Created by SEDAT DALKIRAN on 20.06.2022.
//

import UIKit

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var postListViewModel: PostListViewModel!
    private var selectedBody: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        getData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postViewModel = self.postListViewModel.postAtIndex(indexPath.row)
        self.selectedBody = postViewModel.body
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destination = segue.destination as! PostDetailViewController
            
            destination.selectedBodyTxt = selectedBody
        }
    }
    
    func getData(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        PostService().getPosts(url: url) { posts in
            if let posts = posts {
                self.postListViewModel = PostListViewModel(postList: posts)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postListViewModel == nil ? 0 : self.postListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let postViewModel = self.postListViewModel.postAtIndex(indexPath.row)
        cell.idTxt.text = String(postViewModel.id)
        cell.titleTxt.text = postViewModel.title
        
        return cell
    }
}
