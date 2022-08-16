//
//  ViewController.swift
//  ProgrammingChallenge1
//
//  Created by Hassan Sohail Dar on 16/8/2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var flagPictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasSuffix("png") {
                flagPictures.append(item)

            }
        }
//

        print(flagPictures)
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagPictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = flagPictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController {
            vc.selectedImage = flagPictures[indexPath.row]
            // 3: now push it onto the navigation controller
            
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    
}

