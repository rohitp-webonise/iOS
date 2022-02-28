//
//  ViewController.swift
//  Login
//
//  Created by Rohit Patil on 03/02/22.
//

import UIKit

class ViewController: UIViewController {
  var iconClick = false
    let imageicon = UIImageView()
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
   
    
    @IBOutlet weak var ForgotPassword: UIButton!
    @IBOutlet weak var SkipButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var Register: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //password visibility
      
        imageicon.image = UIImage(named: "group")
        let contentView = UIView()
        contentView.addSubview(imageicon)
        contentView.frame = CGRect(x: 0, y: 0, width: Int(UIImage(named: "group")!.size.width), height: Int(UIImage(named: "group")!.size.height))
       
        imageicon.frame = CGRect(x: -10, y: 0, width: Int(UIImage(named: "group")!.size.width), height: Int(UIImage(named: "group")!.size.height))
       
        Password.rightView = contentView
        Password.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(imageTapped(tapGestureRecognizer:)))
        imageicon.isUserInteractionEnabled = true
        imageicon.addGestureRecognizer(tapGestureRecognizer)
        
        
        
        //radius
        SkipButton.layer.cornerRadius = 22
        
        SkipButton.layer.masksToBounds = true
        SkipButton.titleLabel?.font = SkipButton.titleLabel?.font.withSize(14)
        BackButton.layer.cornerRadius = BackButton.frame.width / 2
        BackButton.layer.masksToBounds = true
        ForgotPassword.titleLabel?.font = ForgotPassword.titleLabel?.font.withSize(14)
        SkipButton.titleLabel?.font = SkipButton.titleLabel?.font.withSize(10)
        SkipButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        BackButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        Register.titleLabel?.font = Register.titleLabel?.font.withSize(14)
        AccounButton.titleLabel?.font = AccounButton.titleLabel?.font.withSize(14)
        
        
        
    }
    @IBOutlet weak var AccounButton: UIButton!
    
    @IBAction func LoginButton(_ sender: UIButton) {

      //LOGIN BUTTON WITH AUTHENTICATION OF EMAIL AND PASSWORD
      
        if (Email.text?.isValidEmail)!{
            print("Email is valid.")
        }
        else{
            print("Email is not valid!")
        }
        if(Password.text?.isValidPassword)!{
            print("password is valid.")
        }
        else{
            print("Password is not valid!")
        }
    }
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        if iconClick
        {
            iconClick = false
            tappedImage.image = UIImage(named: "group")
            Password.isSecureTextEntry = false
        }
        else{
            iconClick = true
            tappedImage.image = UIImage(named: "group-1")
            Password.isSecureTextEntry = true
        }
    }
    
}

extension String {
   var isValidEmail: Bool {
       
       //guard email != nil else { return false }
       
       let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
       
       let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex )
       return emailTest.evaluate(with: self)
   }
    var isValidPassword: Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: self)  }
}
