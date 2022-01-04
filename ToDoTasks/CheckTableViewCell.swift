//
//  CheckTableViewCell.swift
//  ToDoTasks
//
//  Created by Desislava Borisova on 12/2/21.
//

import UIKit

protocol CheckTableViewCellDelegate: AnyObject{
    func checkTableViewCell(_ cell: CheckTableViewCell, didChangeCheckedState isOn: Bool )
}


class CheckTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var checkbox: UISwitch!
    
   weak var delegate: CheckTableViewCellDelegate?
    
    @IBAction func isOn(_ sender: UISwitch) {
        updateChecked()
        delegate?.checkTableViewCell(self, didChangeCheckedState: checkbox.isOn)
        
    }
    
    func set(title: String, isOn: Bool)
    {
        label.text = title
        set(isOn: isOn)
    }
    
    func set( isOn: Bool)
    {
       
        checkbox.isOn=isOn
        updateChecked()
    }
    
    func updateChecked(){
       let attributedString = NSMutableAttributedString(string: label.text!)
       
       if checkbox.isOn{
           attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length-1))
       }else{
           attributedString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributedString.length-1))
       }
       label.attributedText = attributedString
   }
}
