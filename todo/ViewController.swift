//
//  ViewController.swift
//  todo
//
//  Created by Brian Foshee on 4/30/15.
//  Copyright (c) 2015 Brian Foshee. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  @IBOutlet var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.allowsMultipleSelectionDuringEditing = false;
  }

  var list: [String] = []

  @IBAction func addTodoItem(sender: AnyObject) {
    let text = textField.text
    self.list.append(text)
    self.tableView.reloadData()
    self.showAlert(text)
    textField.text = ""
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }

  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }

  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if (editingStyle == UITableViewCellEditingStyle.Delete) {
      self.list.removeAtIndex(indexPath.row)
      self.tableView.reloadData()
    }
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("list") as? UITableViewCell

    if cell == nil {
      cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "list")
    }

    cell!.textLabel!.text = "\(self.list[indexPath.row])"
  
    return cell!
  }

  func showAlert(text: String) {
    let alertController = UIAlertController(title: "Added:", message: text, preferredStyle: .Alert)

    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)

    alertController.addAction(defaultAction)

    self.presentViewController(alertController, animated: true, completion: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

