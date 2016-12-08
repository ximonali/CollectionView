//
//  ViewController.swift
//  CollectionView101
//
//  Created by macadmin on 2016-03-21.
//  Copyright (c) 2016 macadmin. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UISearchBarDelegate {

    //Vars
    //var carsType: [String] = ["car1","car2","car3","car4"]
    //var carsTypeTittle: [String] = ["algo1","algo2","algo3","algo4"]
    
    var myCarObj = CarType();
    var myCarCollection:[CarType] = [];

    //Para mi search bar
    var filteredName = [CarType] ()
    var searchActive = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self;
        
        myCollectionView.delegate = self;
        myCollectionView.dataSource = self;
        
        myCarObj.generateCars();
        myCarCollection = myCarObj.carCollection;
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Datos Necesarios para mi COLLECTIONVIEW
    //1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    //2
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var countNum = 0;
        if searchActive {
            countNum = filteredName.count
        }else
        {
            countNum = myCarCollection.count
        }
        
        return countNum
        
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        //OJO AQUI CAMBIAR (UICollectionViewCell por CollectionViewCell) MI PROPIA CELDA CREADA
        
        // Configure the cell

        if searchActive {
            cell.myImgView.image = filteredName[(indexPath as NSIndexPath).row].carImage
            cell.lblTittle.text = filteredName[(indexPath as NSIndexPath).row].carName
            cell.lblDescription.text = filteredName[(indexPath as NSIndexPath).row].carDesciption
            
        }else
        {
            
            cell.myImgView.image = myCarCollection[(indexPath as NSIndexPath).row].carImage;
            cell.lblTittle.text = myCarCollection[(indexPath as NSIndexPath).row].carName;
            cell.lblDescription.text = myCarCollection[(indexPath as NSIndexPath).row].carDesciption;
            
        }
        
        

        
        //cell.myImgView.image = UIImage(named: carsType[indexPath.row]); // Cambio String = UIImage
        //cell.lblTittle.text = carsTypeTittle[indexPath.row];
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
            
            let CellSize: CGSize = CGSize(width: 120, height: 160)
            return CellSize
    }
    
    /* Search Bar Code Start */
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print("searchBar  textDidChange Calling ")
        
        
        if(searchBar.text!.isEmpty) {
            
            self.searchActive = false
            
        } else {
            
            filteredName.removeAll(keepingCapacity: false)
            
            for index in (0 ..< myCarCollection.count) {
                
                let name = myCarCollection[index].carName
                
                if(name.lowercased().range(of: searchText.lowercased()) != nil ){
                    
                    filteredName.append(myCarCollection[index]);
                    
                    self.searchActive = true
                }
                
            }
        }
        
        self.myCollectionView.reloadData()
        //self.myCollectionView!.reloadData()
    }//end searchBar

    
    
    
    

}

