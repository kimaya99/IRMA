//
//  Questionaire1ViewController.swift
//  LBDLAPP
//
//  Created by Kimaya Desai on 11/29/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import MapKit
import CoreLocation

struct info{
    var gender : String!
    var age: String!
    var date: String!
    var location: String!
    var identity: String!
    
}

var a : String = "male"
var b : String = "0"
var c : String = "12/12/12"
var d : String = "unknown"


class Questionaire1ViewController: UITableViewController {
    @IBOutlet var maleButton: UIButton!
    
    @IBOutlet var femaleButton: UIButton!
    
    @IBOutlet var dateView: UITextField!
     @IBOutlet var mapView: MKMapView!
    let datePicker = UIDatePicker()
    
    let infos = [info].self
    
   
    @IBOutlet weak var ageValue: UITextField!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        
   //  placePoint(one: Double(x) ?? 32.955,two: Double(y) ?? -117.2459)
    }
    
    @IBAction func malePressed(_ sender: Any) {
        a = "male"
        maleButton.setTitleColor(UIColor.red, for: .disabled)
        if a == "male"{
        maleButton.backgroundColor = .green
            femaleButton.backgroundColor = .white
        }
    }
    
    @IBAction func addPin(_ sender: AnyObject) {
        
        let location = sender.location(in: self.mapView)
        let locCord = self.mapView.convert(location,toCoordinateFrom:self.mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = locCord
        annotation.title = "Here"
        annotation.subtitle = " My Address"
        
        self.mapView.removeAnnotations(mapView.annotations)
        self.mapView.addAnnotation(annotation)
        
        
        x = String(locCord.longitude)
        y = String(locCord.latitude)
        
      
        
        let locator = CLGeocoder()
        
        locator.reverseGeocodeLocation(
        CLLocation(latitude: locCord.latitude, longitude: locCord.longitude)) { (placemarks, errors) in
            if let place = placemarks?[0] {
                if let opt1 = place.locality{
                    if let opt2 = place.administrativeArea {
                        if let opt3 = place.country
                        {
                            self.mapLabel.text = "\(opt1),\(opt2),\(opt3)"
                            
                            d = String(describing: self.mapLabel.text)
                        }
                    }
                }
                else {
                    self.mapLabel.text = "Address not Found"
                } }
        }
    }
  
    @IBAction func femalePressed(_ sender: Any) {
        a = "female"
        femaleButton.setTitleColor(UIColor.red, for: .disabled)
        
        if a == "female"{
            femaleButton.backgroundColor = .green
             maleButton.backgroundColor = .white
        }
    }
   
    @IBAction func Steppr(_ sender: UIStepper) {
        ageValue.text = String(Int(sender.value))
        b = String(describing: ageValue.text)
    }
    
   func createDatePicker()
   {
    
    datePicker.datePickerMode = .date
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePress))
    toolbar.setItems([doneButton],animated: false)
    
    guard let x = dateView else {
    return }
    x.inputAccessoryView = toolbar
    x.inputView = datePicker
    }
    
    @objc func donePress(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        
        dateView.text = dateFormatter.string(from: datePicker.date)
        
        c = String(describing: dateView.text)
        self.view.endEditing(true)
    }
    
    var latitudeL = ""
    var longitudeL = ""
    
    var x : String = ""
    var y : String = ""
    
   
    @IBOutlet var mapLabel: UITextField!
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    
    
    
    @IBAction func donePressed(_ sender: AnyObject) {
     
        
        let info : [String:String] = ["gender" : a, "age" : b, "date" : c, "location": d, "identity" : emailAdressForLinking]
        
        let ref = Database.database().reference()
        let key = ref.child("Info").childByAutoId().setValue(info)
      
     
        
        
    }
}
