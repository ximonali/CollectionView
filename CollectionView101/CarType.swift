//
//  CarType.swift
//  CollectionView101
//
//  Created by macadmin on 2016-03-21.
//  Copyright (c) 2016 macadmin. All rights reserved.
//

import UIKit

class CarType {

    var carName: String;
    var carImage: UIImage;
    var carDesciption: String;
    var carCollection: [CarType] = [];
    
    init () {
        carName = "";
        carDesciption = "";
        carImage = UIImage();
    
    }
    
    init (pCarName: String,pCarDesciption: String, pCarImage: UIImage) {
        carName = pCarName;
        carDesciption = pCarDesciption;
        carImage = pCarImage;
        
    }
    
    
    func generateCars () -> [CarType]{
        let a = CarType(pCarName: "BMW", pCarDesciption: "Lorem ipsum dolor sit amet, integer malesuada. ", pCarImage: UIImage(named: "car1")!)
        let b = CarType(pCarName: "Toyota", pCarDesciption: "Pellentesque blandit vestibulum aliquet", pCarImage: UIImage(named: "car2")!)
        let c = CarType(pCarName: "Hyundai", pCarDesciption: "Lorem tristique ornare faucibus.", pCarImage: UIImage(named: "car3")!)
        let d = CarType(pCarName: "Honda", pCarDesciption: "Diam iaculis praesent ac rutrum velit", pCarImage: UIImage(named: "car4")!)
        
        carCollection.append(a);
        carCollection.append(b);
        carCollection.append(c);
        carCollection.append(d);
        
        return carCollection;
    }
    
    

}//end CarType
