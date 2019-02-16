//
//  MainViewController.swift
//  AutoLayoutConstraints
//
//  Created by Ryan Rottmann on 2/15/19.
//  Copyright © 2019 Ryan Rottmann. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let myButton = UIButton()
    let myText = UILabel()
    
    var labelCons: [NSLayoutConstraint] = []
    var buttonCons: [NSLayoutConstraint] = []

    
    var buttonCount = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.backgroundColor = UIColor.orange
        myButton.setTitle("Button!!!", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        
        myText.translatesAutoresizingMaskIntoConstraints = false
        myText.backgroundColor = UIColor.yellow
        myText.text = String(buttonCount)
        self.view.addSubview(myText)
        self.view.addSubview(myButton)
        
        let topConstraint = myButton.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomConstraint = myButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leftConstraint = myButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let rightConstraint = myButton.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        
        let textHeight = myText.heightAnchor.constraint(equalToConstant: 20)
        let textWidth = myText.widthAnchor.constraint(equalToConstant: 50)
        let textXPlacement = myText.centerXAnchor.constraint(equalToSystemSpacingAfter: myButton.rightAnchor, multiplier: 20)
        let textYPlacement = myText.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        self.view .bringSubviewToFront(myText)
        
        labelCons = [textHeight, textWidth, textXPlacement, textYPlacement]
        NSLayoutConstraint.activate(labelCons)

        buttonCons = [topConstraint, bottomConstraint, leftConstraint, rightConstraint]
        NSLayoutConstraint.activate(buttonCons)
        
        myButton.addTarget(self, action: #selector(action), for: .touchUpInside)//on button press

        // Do any additional setup after loading the view.
    }
    
    @objc func action(){
        buttonCount += 1
        
        NSLayoutConstraint.deactivate(buttonCons)

        
        var buttonHeight = myButton.heightAnchor.constraint(equalToConstant: 200)
        var buttonWidth = myButton.widthAnchor.constraint(equalToConstant: 200)
        var buttonXPlacement = myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        var buttonYPlacement = myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        buttonCons = [buttonHeight, buttonWidth, buttonXPlacement, buttonYPlacement]
      
        NSLayoutConstraint.deactivate(buttonCons)
        NSLayoutConstraint.deactivate(labelCons)
        
        myText.translatesAutoresizingMaskIntoConstraints = false
        
        if (buttonCount % 2 == 0){
            myText.backgroundColor = UIColor.yellow
            //myButton.backgroundColor = UIColor.gray

        } else {
            myText.backgroundColor = UIColor.red
            //myButton.backgroundColor = UIColor.blue

        }
        
        myText.text = String(buttonCount)
        
        self.view.addSubview(myText)
        
        if (buttonCount % 3 == 0){
            let textYPlacement = myText.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 50)
            let textHeight = myText.heightAnchor.constraint(equalToConstant: 20)
            let textWidth = myText.widthAnchor.constraint(equalToConstant: 50)
            let textXPlacement = myText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            
            self.view .bringSubviewToFront(myText)
            
            labelCons = [textHeight, textWidth, textXPlacement, textYPlacement]
            
            buttonHeight = myButton.heightAnchor.constraint(equalToConstant: 200)
            buttonWidth = myButton.widthAnchor.constraint(equalToConstant: 100)
            buttonXPlacement = myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            buttonYPlacement = myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            
            buttonCons = [buttonHeight, buttonWidth, buttonXPlacement, buttonYPlacement]

        } else if (buttonCount % 3 == 1){
            let textYPlacement = myText.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 150)
            let textLeftConstraint = myText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
            let textRightConstraint = myText.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            let textXPlacement = myText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            
            self.view .bringSubviewToFront(myText)
            
            labelCons = [textRightConstraint, textLeftConstraint, textXPlacement, textYPlacement]
            
            buttonHeight = myButton.heightAnchor.constraint(equalToConstant: 50)
            buttonWidth = myButton.widthAnchor.constraint(equalToConstant: 300)
            buttonXPlacement = myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            buttonYPlacement = myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            
            buttonCons = [buttonHeight, buttonWidth, buttonXPlacement, buttonYPlacement]
        } else {
            let textYPlacement = myText.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -20)
            let textHeight = myText.heightAnchor.constraint(equalToConstant: 20)
            let textWidth = myText.widthAnchor.constraint(equalToConstant: 50)
            let textXPlacement = myText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 100)
            
            self.view .bringSubviewToFront(myText)
            labelCons = [textHeight, textWidth, textXPlacement, textYPlacement]
            
            buttonHeight = myButton.heightAnchor.constraint(equalToConstant: 400)
            buttonWidth = myButton.widthAnchor.constraint(equalToConstant: 100)
            buttonXPlacement = myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            buttonYPlacement = myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            
            buttonCons = [buttonHeight, buttonWidth, buttonXPlacement, buttonYPlacement]
        }
        
//        buttonHeight = myButton.heightAnchor.constraint(equalToConstant: 200)
//        buttonWidth = myButton.widthAnchor.constraint(equalToConstant: 200)
//        buttonXPlacement = myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//        buttonYPlacement = myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//
//        buttonCons = [buttonHeight, buttonWidth, buttonXPlacement, buttonYPlacement]

        self.view.bringSubviewToFront(myText)
        
        NSLayoutConstraint.activate(labelCons)
        NSLayoutConstraint.activate(buttonCons)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
