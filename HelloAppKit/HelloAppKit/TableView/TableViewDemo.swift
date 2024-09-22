//
//  TableViewController.swift
//  HelloAppKit
//
//  Created by Kyuhyun Park on 9/15/24.
//

import Cocoa

// Mastering macOS programming, Packt Publishing (2017), 7 장 참고

func showTableViewDemo() {
    WindowBuilder(title: "Table View", viewController: TableViewDemoController()).showAtCenter().retainWindow()
}

class TableViewDemoController: NSViewController {

    var personArrayWrapper = PersonArrayWrapper(content: [
        Person(name: "Kirk", busy: true, shirtColor: .blue),
        Person(name: "Scottie", busy: false, shirtColor: .red),
    ])

    let kContentKeyPath = "content"
    private var personArrayWrapperContext = 0
    
    var tableView: NSTableView!
    var infoLabel: NSTextField!
        
    deinit {
        personArrayWrapper.removeObserver(self, forKeyPath: kContentKeyPath)
    }
    
    override func loadView() {
        super.loadView()
        print("TableViewController loadView")
        
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 600, height: 300))
        view.wantsLayer = true
        //view.layer?.backgroundColor = NSColor.white.cgColor
            
        personArrayWrapper.addObserver(
            self,
            forKeyPath: kContentKeyPath,
            options:[.new, .old],
            context: &personArrayWrapperContext
        )

        // Add table
        let tableRect = CGRect(x: 20, y: 115, width: 240, height: 135)
        self.tableView = NSTableView(frame: tableRect)
        tableView.dataSource = self
        tableView.delegate = self
        
        let tableScrollView = NSScrollView(frame: tableRect)
        tableScrollView.documentView = tableView
        //tableScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableScrollView)
                
        // Configure table
        let nameColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "nameColumn"))
        nameColumn.title = "Name"
        nameColumn.minWidth = 100
        tableView.addTableColumn(nameColumn)
        
        let statusColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "statusColumn"))
        statusColumn.title = "Status"
        statusColumn.minWidth = 130
        tableView.addTableColumn(statusColumn)
        
        tableView.intercellSpacing = CGSize(width: 5.0, height: 5.0)
        tableView.usesAlternatingRowBackgroundColors = true
        
        // Add TextField
        let infoLabel = NSTextField(frame: NSRect(x: 268, y: 228, width: 192, height: 22))
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoLabel)
        self.infoLabel = infoLabel
        
        // Add Add Button
        let addButton = NSButton(frame: CGRect(x: 268, y: 178, width: 192, height: 32))
        addButton.bezelStyle = .rounded
        addButton.title = "Add"
        addButton.target = self
        addButton.action = #selector(addButtonClicked)
        view.addSubview(addButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TableViewController viewDidLoad")
    }
    
    @objc func addButtonClicked() {
        print("addButtonClicked")
        let person = Person(name: "Lt. Uhura", busy: true, shirtColor: .red)
        self.personArrayWrapper.add(person: person)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                                of object: Any?,
                                change: [NSKeyValueChangeKey : Any]?,
                                context: UnsafeMutableRawPointer?)
    {
        print("observeValue")
        if keyPath == kContentKeyPath {
            tableView.reloadData()
            return
        }
        super.observeValue(forKeyPath: keyPath,
                           of: object,
                           change: change,
                           context: context)
    }
    
}

extension TableViewDemoController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.personArrayWrapper.count
    }
    
}

extension TableViewDemoController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?
    {
        if tableColumn == tableView.tableColumns[0] {
            let cellIdentifier = NSUserInterfaceItemIdentifier("NameCellID")
            var cell = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTextField
            if cell == nil {
                cell = NSTextField(frame: NSRect( x: 0, y: 0, width: tableView.frame.size.width, height: 0))
            }
            if let cell {
                cell.identifier = cellIdentifier
                cell.stringValue = personArrayWrapper.content[row].name
                cell.textColor = personArrayWrapper.content[row].shirtColor
                cell.backgroundColor = .clear
                cell.isBezeled = false
                cell.isEditable = false
            }
            return cell
        } 
        if tableColumn == tableView.tableColumns[1] {
            let cellIdentifier = NSUserInterfaceItemIdentifier("StatusCellID")
            var cell = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTextField
            if cell == nil {
                cell = NSTextField(frame: NSRect(x: 0, y: 0, width: tableView.frame.size.width, height: 0))
            }
            if let cell {
                cell.identifier = cellIdentifier
                cell.stringValue = personArrayWrapper.content[row].busy ? "Busy" : "Not busy"
                cell.backgroundColor = .clear
                cell.isBezeled = false
                cell.isEditable = false
            }
            return cell
        }
        return nil
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 22.0
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let tableView = notification.object as! NSTableView
        let indexes = tableView.selectedRowIndexes
        if let index = indexes.first {
            self.infoLabel.stringValue = personArrayWrapper.content[index].name
        }
    }
}
