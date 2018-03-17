//
//  ViewController.swift
//  Box8Assignment
//
//  Created by Sanjay Mali on 15/03/18.
//  Copyright © 2018 Sanjay Mali. All rights reserved.
//
import UIKit
class RegisterViewController: UIViewController,ShowAlertView,UITextFieldDelegate{
    var userdefualt = UserDefaults()
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    var userDefaultDetails = UserDefaultDetails()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Box8"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(loginRegisterSegmentedControl)
        setupInputsContainerView()
        setupLoginRegisterButton()
        setupLoginRegisterSegmentedControl()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "annie-spratt-218696-unsplash")!)
        self.passwordTextField.delegate = self
        self.emailTextField.delegate = self

    }
    
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
     }
    
    private func animate(){
        loginRegisterButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        UIView.animate(withDuration: 0.5) {
            self.emailTextField.transform = CGAffineTransform.identity
            self.passwordTextField.transform = CGAffineTransform.identity
            self.nameTextField.transform = CGAffineTransform.identity
            self.loginRegisterButton.transform = CGAffineTransform.identity
            
        }
    }
    

    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.layer.shadowOffset = CGSize(width:10, height:10);
        view.layer.shadowRadius = 5;
        view.layer.shadowOpacity = 0.5;
        return view
    }()
    
    lazy var loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.white
        button.setTitle("Register", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = false;
        button.layer.shadowOffset = CGSize(width:0, height:0);
        button.layer.shadowRadius = 5;
        button.layer.shadowOpacity = 0.1;
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    @objc func handleLoginRegister() {
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }
    func handleLogin() {
        if emailTextField.text == "" || passwordTextField.text == "" {
            self.showAlert(message:"Please enter the Email,Password")
        }else{
            let userInfo = userDefaultDetails.getUserDetails()
            print("userInfo:\(userInfo)")
            if userInfo["Password"] == passwordTextField.text! && userInfo["Email"] == emailTextField.text!{
                self.showAlert(message:"Success")
            }else{
                self.showAlert(message:"Something Wrong with the Email and Password")
            }
        }
        
    }
    func handleRegister(){
        if nameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == ""{
            self.showAlert(message:"Please enter the Name, Email, Password")
        }else if nameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != ""{
            let dic = ["Name":"\(self.nameTextField.text!)",
                "Email":"\(self.emailTextField.text!)","Password":"\(self.passwordTextField.text!)"]
            userDefaultDetails.saveUserDetails(dic: dic)
            self.showAlert(message:"Succesfully Saved")
        }else{
            self.showAlert(message:"Something Went Wrong")
        }
    }
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.masksToBounds = false;
        tf.layer.shadowOffset = CGSize(width:10, height:10);
        tf.layer.shadowRadius = 5;
        tf.layer.shadowOpacity = 0.5;
        
        return tf
    }()
    
    let nameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false;
        view.layer.shadowOffset = CGSize(width:10, height:10);
        view.layer.shadowRadius = 5;
        view.layer.shadowOpacity = 0.5;
        
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.masksToBounds = false;
        tf.layer.shadowOffset = CGSize(width:10, height:10);
        tf.layer.shadowRadius = 5;
        tf.layer.shadowOpacity = 0.5;
        
        return tf
    }()
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false;
        view.layer.shadowOffset = CGSize(width:10, height:10);
        view.layer.shadowRadius = 5;
        view.layer.shadowOpacity = 0.5;
        
        return view
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.layer.masksToBounds = false;
        tf.layer.shadowOffset = CGSize(width:10, height:10);
        tf.layer.shadowRadius = 5;
        tf.layer.shadowOpacity = 0.5;
        
        return tf
    }()
    
    let mobileTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Mobile"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.layer.masksToBounds = false;
        tf.layer.shadowOffset = CGSize(width:10, height:10);
        tf.layer.shadowRadius = 5;
        tf.layer.shadowOpacity = 0.5;
        
        return tf
    }()
    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["SIGN IN", "SIGN UP"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor.white
        sc.selectedSegmentIndex = 1
        sc.layer.masksToBounds = false;
        sc.layer.shadowOffset = CGSize(width:10, height:10);
        sc.layer.shadowRadius = 5;
        sc.layer.shadowOpacity = 0.5;
        //        sc.backgroundColor = UIColor.lightGray
        sc.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return sc
    }()
    
    @objc func handleLoginRegisterChange() {
        animate()
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        loginRegisterButton.setTitle(title, for: UIControlState())
        inputsContainerViewHeightAnchor?.constant = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        nameTextFieldHeightAnchor?.isActive = false
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        nameTextField.isHidden = loginRegisterSegmentedControl.selectedSegmentIndex == 0
        
        emailTextFieldHeightAnchor?.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailTextFieldHeightAnchor?.isActive = true
        
        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
        
    }
    
    
    func setupLoginRegisterSegmentedControl() {
        //need x, y, width, height constraints
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -24).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, multiplier: 1).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupInputsContainerView() {
        //need x, y, width, height constraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputsContainerViewHeightAnchor?.isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(passwordTextField)
        
        //need x, y, width, height constraints
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        
        //need x, y, width, height constraints
        nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //need x, y, width, height constraints
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        emailTextFieldHeightAnchor?.isActive = true
        
        //need x, y, width, height constraints
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //need x, y, width, height constraints
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
    }
    
    func setupLoginRegisterButton() {
        //need x, y, width, height constraints
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
