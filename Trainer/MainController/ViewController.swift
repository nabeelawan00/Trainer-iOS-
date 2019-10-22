//
//  ViewController.swift
//  Trainer
//
//  Created by Bills Mac on 23/09/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import UIKit

// MARK: - NABEEL AWAN

class ViewController: UIViewController {
    
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var txtSelectDate: UITextField!
    @IBOutlet weak var btnLetsGo: UIButton!
    var isRenew = false
    
    let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtSelectDate.delegate = self
        self.txtTime.delegate = self
        addNavBarImage()
        
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
        
        let vc = (storyboard?.instantiateViewController(withIdentifier: StoryBoardIds.trainerLIstSID.rawValue))!
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == self.txtSelectDate){
        self.showDatePicker()
        }
        else if(textField == txtTime){
            
        }
    }
}
