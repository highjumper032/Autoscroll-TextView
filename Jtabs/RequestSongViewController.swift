//
//  RequestSongViewController.swift
//  Jtabs
//
//  Created by High Jumper on 10/23/16.
//  Copyright © 2016 High Jumper. All rights reserved.
//

import UIKit
import MessageUI

class RequestSongViewController: UIViewController, UITextViewDelegate, MFMailComposeViewControllerDelegate {
    

    @IBOutlet weak var request: UIButton!
    
    @IBOutlet weak var textView: UITextView!

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        if(text == "\n")
        {
            view.endEditing(true)
            return false
        }
        else
        {
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.automaticallyAdjustsScrollViewInsets = false
        textView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
   
    
    @IBAction func request(_ sender: AnyObject) {
        var textValue: String
        textValue = textView.text
        sendEmail(textValue: textValue)
        
    }
   
    func sendEmail(textValue: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["poleyeffd@yahoo.com"])
            mail.setSubject("Here is some feedback on the Jtabs:")
            mail.setMessageBody( textValue, isHTML: false)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        textView.text = ""
        controller.dismiss(animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
