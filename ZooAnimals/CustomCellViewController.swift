//
//  CustomCellViewController.swift
//  ZooAnimals
//
//  Created by Alex Paul on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CustomCellViewController: UIViewController {

    @IBOutlet weak var customCellTabelView: UITableView!
    
    var animals = [ZooAnimal]() {
        didSet {
//            customCellTabelView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customCellTabelView.delegate = self
        customCellTabelView.dataSource = self
        loadData()
    }
    
    func loadData() {
        animals = ZooAnimal.zooAnimals
    }
    
}

extension CustomCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else {
            
            fatalError("failed to dequeue an AnimalCell") // crashes if AnimalCell is not setup correctly
        }
        
        //get current object at indexPath
        let animal = animals[indexPath.row]
        
        //configure the cell
        cell.configueCell(for: animal)
        
        return cell
    }
}

extension CustomCellViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140
    }
}
