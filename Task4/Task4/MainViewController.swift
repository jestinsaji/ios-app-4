//
//  ViewController.swift
//  Task4
//
//  Created by Apps Team Mac book Air on 27/09/21.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
   // weak var cellDelegate: CollectionViewCellDelegate? //delegate

    var namearr = ["images-1", "images-2", "images-3", "images-4", "images-5"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10
        // return namearr.count
    }
    
    func detailView(tindex:Int,cindex:Int)
    {
       guard let vc = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier:"DetailViewController") as? DetailViewController
       else{
           return
       }
//        vc?.name = namearr[indexPath.row]
//        vc?.img.image = UIImage(named: namearr[indexPath.row])
       // vc.name = namearr.[tindex].namearr.namearr[cindex]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreTableViewCell", for: indexPath)as! ExploreTableViewCell
        
        cell.didSelectClosure = {tableIndex, collectionIndex in
            if let tableIndexp = tableIndex, let collectionIndexp = collectionIndex
            {
                self.detailView(tindex: tableIndexp, cindex: collectionIndexp)
            }
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier:"vc") as? DetailViewController
//        vc?.name = namearr[indexPath.row]
//        vc?.img.image = UIImage(named: namearr[indexPath.row])
//        self.navigationController?.pushViewController(vc!, animated: true)
//    }
//    
    
    //delegate
   
//        func collectionView(collectionviewcell: ExploreTableViewCell?, index: Int, didTappedInTableViewCell: ExploreTableViewCell) {
//
//                print("You tapped the cell \(index) in the row of colors ")
//        }
    

}
    


