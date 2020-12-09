//
//  ViewController.swift
//  FileParsingJSON
//
//  Created by Urban_MacOS on 07/12/2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var result: Post?
    
    /*private let tableView: UITableView = {
        let table = UITableView(frame: .zero,
                                style: .grouped)
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        print("does this follow through?")
        return table
    }()*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPostData()
        //tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let result = result {
            return result.data.count
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Hello World"
        //try result = result
        //print(result.data.count)
        return cell*/
        let text = result?.data[indexPath.row].employee_name
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = text
        return cell    }
    
    /*func numberOfSections(in tableView: UITableView) -> Int {
        return result?.data.count ??  0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "some text"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = result {
            return result.data.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let text = result?.data[indexPath.section].employee_name
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "spome text"
        return cell
    }*/
    
    func fetchPostData() {
        
        let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
            
            //guard let result = result else { return }
            
            do {
                let jsonData = try Data(contentsOf: url)
                result = try JSONDecoder().decode(Post.self, from: jsonData)
                //print(postsData)
                //print(result.data.count)
                
            }
            catch {
                let error = error
                print(error.localizedDescription)
            }
    }
}

/*
 override func viewDidLoad() {
     super.viewDidLoad()
     
     fetchPostData { (posts) in
         for post in posts {
             print(post.title!)
         }
     }
 }
 func fetchPostData(completionHandler: @escaping ([Post]) -> Void) {
     
     let url = URL(string: "http://jsonplaceholder.typicode.com/posts")!
     
     let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
         
         guard let data = data else { return }
         
         do {
             
             let postsData = try JSONDecoder().decode([Post].self, from: data)
             
             completionHandler(postsData)
         }
         catch {
             let error = error
             print(error.localizedDescription)
         }
     }.resume() */
