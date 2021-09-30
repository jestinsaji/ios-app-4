//
//  ExploreTableViewCell.swift
//  Task4
//
//  Created by Apps Team Mac book Air on 27/09/21.
//

import UIKit

typealias DidSelectClosure = ((_ tableIndex: Int?,_ collectionIndex: Int?)-> Void)

class ExploreTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//    weak var cellDelegate: CollectionViewCellDelegate? //delegate
    //cell.cellDelegate = self // delegate method

    @IBOutlet var collectionView: UICollectionView!
    
    var namearr = ["images-1", "images-2", "images-3", "images-4", "images-5","images-6", "images-7", "images-8", "images-9", "images-10"]
    var didSelectClosure: DidSelectClosure?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 132, height: 134)
    }
    

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"DetailViewController") as? DetailViewController
//
//        vc?.name = namearr[indexPath.row]
//        vc?.imagename = namearr[indexPath.row]
//        //self.navigationController.pushViewController(vc, animated: true)
//
//    }
   
    func topViewController() -> UIViewController? {

        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

        if var topController = keyWindow?.rootViewController {

            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController

        } else {
            return nil
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier:"DetailViewController") as? DetailViewController {
            
            vc.name = namearr[indexPath.row]
            vc.imagename = namearr[indexPath.row]

            print("You tapped the cell\(indexPath) with car name \(namearr[indexPath.row]) ")

          
            vc.img.image = UIImage(named: namearr[indexPath.row])
          topViewController()?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
//        didSelectClosure?(namearr.indexPath.row, indexPath.row)
//        DidSelectClosure?(namearr.indexPath.row, UIImage(named: namearr[indexPath.row])
//        vc?.name = namearr[indexPath.row]
//        vc?.img.image = UIImage(named: namearr[indexPath.row])
//     }
//

    //delegate method
    
////    protocol CollectionViewCellDelegate: AnyObject {
//    func collectionView(collectionviewcell: ExploreTableViewCell?, index: Int, didTappedInTableViewCell: ExploreTableViewCell){
//
//    }
//    }

    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//           let cell = collectionView.cellForItem(at: indexPath) as! ExploreTableViewCell
//           //self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
//       }
//    
}
    
    
    
    
    

