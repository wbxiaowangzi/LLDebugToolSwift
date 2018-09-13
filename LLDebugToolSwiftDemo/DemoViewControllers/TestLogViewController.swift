//
//  TestLogViewController.swift
//  LLDebugToolSwiftDemo
//
//  Created by Li on 2018/9/13.
//

import UIKit
import LLDebugTool

class TestLogViewController: BaseTestViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("test.color.style", comment: "")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if (indexPath.row == 0) {
            cell.textLabel?.text = "Use \"LLConfigColorStyleHack\""
            cell.accessoryType = LLConfig.shared().colorStyle == .hack ? .checkmark : .none
        } else if (indexPath.row == 1) {
            cell.textLabel?.text = "Use \"LLConfigColorStyleSimple\""
            cell.accessoryType = LLConfig.shared().colorStyle == .simple ? .checkmark : .none
        } else if (indexPath.row == 2) {
            cell.textLabel?.text = "Use \"LLConfigColorStyleSystem\""
            cell.accessoryType = LLConfig.shared().colorStyle == .system ? .checkmark : .none
        } else if (indexPath.row == 3) {
            cell.textLabel?.text = "Use \"[[LLConfig sharedConfig] configBackgroundColor:[UIColor orangeColor] textColor:[UIColor whiteColor] statusBarStyle:UIStatusBarStyleDefault]\""
            cell.accessoryType = LLConfig.shared().colorStyle == .custom ? .checkmark : .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            self.testHackColorStyle()
        } else if (indexPath.row == 1) {
            self.testSimpleColorSytle()
        } else if (indexPath.row == 2) {
            self.testSystemColorStyle()
        } else if (indexPath.row == 3) {
            self.testCustomColorConfig()
        }
        tableView.reloadData()
    }
    
    // MARK: - ACTIONS
    func testHackColorStyle() {
        LLConfig.shared().colorStyle = .hack
        LLDebugTool.shared().showDebugViewController(with: 0)
    }
    
    func testSimpleColorSytle() {
        LLConfig.shared().colorStyle = .simple
        LLDebugTool.shared().showDebugViewController(with: 0)
    }
    
    func testSystemColorStyle() {
        LLConfig.shared().colorStyle = .system
        LLDebugTool.shared().showDebugViewController(with: 0)
    }
    
    func testCustomColorConfig() {
        LLConfig.shared().configBackgroundColor(.orange, textColor: .white, statusBarStyle: .default)
        LLDebugTool.shared().showDebugViewController(with: 0)
    }

}
