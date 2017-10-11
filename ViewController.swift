//
//  ViewController.swift
//  SkyCatchTest
//
//  Created by digvijay mallegowda on 9/30/17.
//  Copyright © 2017 InfinityDeveloperZone. All rights reserved.
//

import UIKit

class ViewController: UITableViewController   {
    
   
    var moviedata:[Movies] = []
    let cellID = "cellID"
    let headerID = "headerID"
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
       
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TabelCell.self, forCellReuseIdentifier: cellID)
        tableView.register(TabelHeader.self, forHeaderFooterViewReuseIdentifier: headerID)
        tableView.sectionHeaderHeight = 60
        
        sortButSet()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       tableView.reloadData()


    }
    
//    Custom Navigation button for sort
    func sortButSet()  {
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "HOME"
        let but = UIButton(type : .infoLight)
        but.addTarget(self, action: #selector(sortList), for: .touchUpInside)
        but.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: but)
    }
    
    @objc func sortList()  {
        let actionsheet = UIAlertController(title: "SORT BY", message: nil , preferredStyle: .actionSheet)
        let sortByTitle = UIAlertAction(title: "Title Descending", style: .default) { (action) in
            self.moviedata.sort(by: { (x, y) -> Bool in
                guard let item1 = x.title, let item2 = y.title else {return false}
               return item1 > item2
            })
         self.tableView.reloadData()
            print("Sort by title")
            
        }
        let sortByTitleAce = UIAlertAction(title: "Title Ascending", style: .default) { (action) in
            self.moviedata.sort(by: { (x, y) -> Bool in
                 guard let item1 = x.title, let item2 = y.title else {return false}
                return item1 < item2
            })
            self.tableView.reloadData()
            print("Sort by title")
            
        }
        
        
        let sortByLocAce = UIAlertAction(title: "Location Ascending", style: .default) { (action) in
            self.moviedata.sort(by: { (x, y) -> Bool in
                guard let item1 = x.locations, let item2 = y.locations else {return false}
                return item1 < item2
            })
            self.tableView.reloadData()
            print("Sort by loc")
            
        }
        
        
        
        let sortBuyLocations = UIAlertAction(title: "Location Descending", style: .default) { (action) in
            self.moviedata.sort(by: { (x, y) -> Bool in
                guard let item1 = x.locations, let item2 = y.locations else {return false}
                return item1 > item2
            })
            self.tableView.reloadData()
            print("sort by location")
        
        }
        let sortbyYear = UIAlertAction(title: "Year Descending", style: .default) { (action) in
            self.moviedata.sort(by: { (x, y) -> Bool in
                 guard let item1 = x.release_year, let item2 = y.release_year else {return false}
                return item1 > item2
            })
            self.tableView.reloadData()
            print("sort by year")
        }
        let sortbyYearAce = UIAlertAction(title: "Year Ascending ", style: .default) { (action) in
            self.moviedata.sort(by: { (x, y) -> Bool in
                 guard let item1 = x.release_year, let item2 = y.release_year else {return false}
                return item1 < item2
            })
            self.tableView.reloadData()
            print("sort by year")
        }
        
        let cancel = UIAlertAction(title: "CANCEL", style: .cancel) { (act) in
            
        }
        actionsheet.addAction(sortByTitleAce)
        actionsheet.addAction(sortByTitle)
        actionsheet.addAction(sortByLocAce)
        actionsheet.addAction(sortBuyLocations)
        actionsheet.addAction(sortbyYearAce)
        actionsheet.addAction(sortbyYear)
        actionsheet.addAction(cancel)
        present(actionsheet, animated: true, completion: nil)
        
    }
    
// Async Json fetching
    func fetch()   {

        let urlToGet = "https://data.sfgov.org/resource/wwmu-gmzc.json"
        let urls = URL(string: urlToGet)
        guard let url = urls else {return }


        URLSession.shared.dataTask(with: url) { (data, response, err) in

            guard let  datas = data , err == nil , response != nil else {
                print("something is wrong")
                return
            }

            do{
                let decoder = JSONDecoder()
                let store = try decoder.decode([Movies].self, from: datas)
                self.moviedata = store
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            } catch {

                print("err")
            }

            }.resume()



    }
//   tabelview settings
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviedata.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID , for: indexPath  ) as! TabelCell
        var moviedatas : Movies!
        moviedatas = moviedata[indexPath.row]
        cell.updateUI(data: moviedatas)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var moviedatas : Movies!
        moviedatas = moviedata[indexPath.row]
        let mapObj = MapViewController()
        mapObj.movieLoc = moviedatas
        navigationController?.pushViewController(mapObj, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID)
    }

}





