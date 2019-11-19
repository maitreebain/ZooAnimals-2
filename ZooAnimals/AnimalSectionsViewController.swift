//
//  AnimalSectionsViewController.swift
//  ZooAnimals
//
//  Created by Alex Paul on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class AnimalSectionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var animalClassifications = [[ZooAnimal]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    func loadData() {
        animalClassifications = ZooAnimal.classificationSections()
    }
    

}

extension AnimalSectionsViewController: UITableViewDataSource {
    //MARK: required table view source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalClassifications[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else {
            fatalError("Couldn't dequeue an AnimalCell")
        }
        
        let animal = animalClassifications[indexPath.section][indexPath.row]
        
        cell.configueCell(for: animal)
        
        return cell
    }
    
    //MARK: - methods needed to implement sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return animalClassifications[section].first?.classification
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animalClassifications.count
    }
}

extension AnimalSectionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
