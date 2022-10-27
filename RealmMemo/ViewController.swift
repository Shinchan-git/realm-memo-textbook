//
//  ViewController.swift
//  RealmMemo
//
//  Created by Owner on 2022/10/26.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    let realm = try! Realm()
    var memoArray: [Memo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        memoArray = readAll()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = memoArray[indexPath.row].text
        if memoArray[indexPath.row].isMarked {
            configuration.image = UIImage(systemName: "star.fill")
        } else {
            configuration.image = UIImage(systemName: "star")
        }
        cell.contentConfiguration = configuration
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func addNew(memo: Memo) {
        create(memo: memo)
        memoArray = readAll()
        table.reloadData()
    }
    
    func readAll() -> [Memo] {
        return Array(realm.objects(Memo.self))
    }
    
    func create(memo: Memo) {
        try! realm.write {
            realm.add(memo)
        }
    }

}

