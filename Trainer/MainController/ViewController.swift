//
//  ViewController.swift
//  Trainer
//
//  Created by Bills Mac on 23/09/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import UIKit
import MBProgressHUD

// MARK: - NABEEL AWAN

class ViewController: UIViewController {
    
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var txtSelectDate: UITextField!
    @IBOutlet weak var btnLetsGo: UIButton!
    @IBOutlet weak var txtMuscleGroup: UITextField!
    @IBOutlet weak var txtFitnessStudio: UITextField!
    @IBOutlet weak var txtMetroArea: UITextField!
    
    var isRenew = false
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtSelectDate.delegate = self
        self.txtTime.delegate = self
        addNavBarImage()
        
        let status = isInternetAvailable
        
        if(status() == true){
            
        }else{
            showOneButtonAlertView(title: "TRIOFIT",message: "Please check your internet connection")
        }
        
    }
    
    // method for showing time picker
    
    func showTimePicker() {
        
        //Formate Date
        datePicker.datePickerMode = .time
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTimePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTimePicker));
        
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        
        txtTime.inputAccessoryView = toolbar
        txtTime.inputView = datePicker
        
    }
    
    @objc func doneTimePicker(){
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        txtTime.text = formatter.string(from: datePicker.date)
        self.txtTime.resignFirstResponder()
        //      self.view.endEditing(true)
    }
    
    @objc func cancelTimePicker(){
        self.txtTime.resignFirstResponder()
        //      self.view.endEditing(true)
    }
    
    //method for showing date picker
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelDatePicker));
        
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        
        txtSelectDate.inputAccessoryView = toolbar
        txtSelectDate.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txtSelectDate.text = formatter.string(from: datePicker.date)
        self.txtSelectDate.resignFirstResponder()
        //      self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.txtSelectDate.resignFirstResponder()
        //      self.view.endEditing(true)
    }
    // button action to move Event list controller
    
    @IBAction func movetoNextScrenn(_ sender: UIButton) {
        
        callAPi(txtSelectDate: "2018-12-20", txtTime: "2018-12-20", txtMetroArea: "2018-12-20", txtFitnessStudio: "2018-12-20", txtMuscleGroup: "2018-12-20")
        
        //        if checkFieldsAreEmpty() {
        //                    self.showOneButtonAlertView(title: "TRIOFIT", message: "Please fill all fields")
        //                } else {
        //        //            email and password check.
        //        //            fildes are not empty so send the data to server.
        //        //            make the server request and send data to senrver.
        ////                    callAPi(email: nil, password: nil)
        //
        //
        //
        //                }
        
    }
}

extension ViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField {
        case txtSelectDate:
            self.showDatePicker()
        case txtTime:
            self.showTimePicker()
        default:
            print("nothing will happen")
            
        }
    }
    
}

// Custom Function Extension.
extension ViewController {
    
    //    function check that is fields are empty return true is fields are empty.
    func checkFieldsAreEmpty() -> Bool {
        if txtTime.text!.isEmpty || txtSelectDate.text!.isEmpty || txtMetroArea.text!.isEmpty || txtMuscleGroup.text!.isEmpty || txtFitnessStudio.text!.isEmpty{
            return true
        }
        return false
    }
    
    //    send data to server. calling API.
    //    this api is work for both login and sigup.
    func callAPi(txtSelectDate: String?, txtTime: String?, txtMetroArea:String?, txtFitnessStudio: String?, txtMuscleGroup: String?) {
        
        //        self.delegate.showActivityIndicatory(uiView: self.view)
        let completeUrl = URL(string: WebServices.skakuBaseURL + WebServices.event)
        var paremeters = ["":""]
        let headers = ["Accept": "application/json",
                      "ClientService": "trainer-client",
                      "AuthKey": "ItIsfoRSeCurty!@).(@"
        ]
        
        if txtSelectDate != nil {
            paremeters = ["date": txtSelectDate! ,
                          "beginning_time": txtTime! ,
                          "metropolition_area": txtMetroArea! ,
                          "fitnessstudio": txtFitnessStudio! ,
                          "muscle_group": txtMuscleGroup!]
        } else {
            paremeters = ["date": txtSelectDate!,
                          "beginning_time": txtTime!,
                          "metropolition_area": txtMetroArea!,
                          "fitnessstudio": txtFitnessStudio!,
                          "muscle_group": txtMuscleGroup!]
        }
        MBProgressHUD.showAdded(to: self.view, animated: true)
        WebServices.callApiWith(url: completeUrl!, method: .post, parameters: paremeters, headers: headers, withSucces: { [weak self] (data) in
            
            guard let strongSelf = self else {return}
            let decoder = JSONDecoder()
            do{
                MBProgressHUD.hide(for: strongSelf.view , animated: true)
                let response = try decoder.decode(RootEvent.self, from: data as! Data)
                
                self?.movetoNextScreen(with: response)
                
            }catch let error{
                print(error.localizedDescription)
                MBProgressHUD.hide(for: strongSelf.view, animated: true)
            }
        }) { (error) in
            print(error)
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    func movetoNextScreen(with response: RootEvent) {
        
        let vc = (storyboard?.instantiateViewController(withIdentifier: StoryBoardIds.trainerLIstSID.rawValue)) as! EventListViewController
        vc.rootResponse = response
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
