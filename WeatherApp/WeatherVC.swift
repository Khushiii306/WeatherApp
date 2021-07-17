
//  Created by DCS on 09/07/21.
//  Copyright © 2021 vishal. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    var CityName = ""
    var image = ""
    private var cityarray = [CityDetail]()
    
   
 
    private let statusLabel:UILabel = {
        let labl = UILabel()
        labl.text = ""
        labl.font = UIFont(name: "", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .black
        labl.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    

    
   
    
    private let cityStateLabel:UILabel = {
        let labl = UILabel()
        labl.text = ""
        labl.font = UIFont(name: "", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .black
        labl.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    
    private let tempLabel:UILabel = {
        let labl = UILabel()
        labl.text = ""
        labl.font = UIFont(name: "Copperplate", size: 90.0)
        labl.textAlignment = .center
        labl.textColor = .black
        labl.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    

    private let lastUpdateLabel:UILabel = {
        let labl = UILabel()
        labl.text = ""
        labl.font = UIFont(name: "", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .white
        labl.backgroundColor = .gray
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
   
    
    private let icon:UIImageView = {
        let imgv = UIImageView()
        imgv.layer.cornerRadius = 5
        imgv.clipsToBounds = true
        return imgv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        view.addSubview(statusLabel)
        view.addSubview(tempLabel)
        view.addSubview(cityStateLabel)
        view.addSubview(lastUpdateLabel)
        view.addSubview(icon)
       
        
        
        let bckimage = UIImageView(frame: UIScreen.main.bounds)
        bckimage.image = UIImage(named: "a10.jpg")
        bckimage.contentMode = UIView.ContentMode.scaleToFill
       self.view.insertSubview(bckimage, at: 0)
        
        self.view.backgroundColor = .white
        CityName = UserDefaults.standard.value(forKey: "name") as! String
        getdata(name: CityName)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        icon.frame = CGRect(x: 20, y: view.height/2-230, width: 64, height: 64)
        statusLabel.frame = CGRect(x: 40, y: icon.bottom + 50, width: view.width - 60, height: 50)
        cityStateLabel.frame = CGRect(x: 70, y: statusLabel.bottom + 5, width: view.width - 130, height: 30)
        tempLabel.frame = CGRect(x: 40, y: cityStateLabel.bottom + 60, width: view.width - 80, height: 100)
       
        lastUpdateLabel.frame = CGRect(x: 70, y: tempLabel.bottom + 50, width: view.width - 130, height: 30)
        
    }
    
    func getdata(name:String)
    {
        self.CityName = name.replacingOccurrences(of: " ", with: "")
        cityarray = ApiHandler.shared.searchcity(with: name)
        for i in cityarray{
            print(i.location.country)
            statusLabel.text = i.current.condition.text
            cityStateLabel.text = i.location.name+","+i.location.country
            tempLabel.text = String(i.current.temp_c)+" C"
            image = i.current.condition.icon
            image = image.replacingOccurrences(of: "//cdn.weatherapi.com/", with: "")
            icon.image = UIImage(named: image)
            lastUpdateLabel.text = i.current.last_updated
            
        }
    }
}

extension WeatherVC:UISearchBarDelegate{

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print("searching..")
        view.endEditing(true)
        
    }
}

