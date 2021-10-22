import UIKit

// MARK: - Classes are reference types.
// When you assign a class instance to another variable and some of its fields is changed in that variable,
// you entirely change its memory address of that value.

class ProductC {
	var title: String
	
	init(title: String) {
		self.title = title
	}
}

var firstItem = ProductC(title: "apple")
var secondItem = firstItem

/* secondItem is pointing to the same address with the firstItem.
So, memory address of firstItem is also changed. See results below. */
secondItem.title = "car"

print("First item is", firstItem.title)
print("Second item is", secondItem.title)

// MARK: - Structs are value types.
// When you assign the value of a struct variable to another one, you are just passing a copy to the second.

struct ProductS {
	var title: String
}

var thirdItem = ProductS(title: "home")
var fourthItem = thirdItem

/* fourthItem is pointing to the different memory address with the thirdItem. When you change fourthItem content, you are not dealing with thirdItem's memory space which is in a different location. */
fourthItem.title = "laptop"

print("\nThird item is", thirdItem.title)
print("Fourth item is", fourthItem.title)

// MARK: - Classes can be inherited.

class Device {
	var name: String
	
	init(name: String) {
		self.name = name
	}
	
	func getName() -> String {
		return self.name.uppercased()
	}
}

class Phone: Device {
	var model: String
	
	init(name: String, model: String) {
		self.model = model
		super.init(name: name)
	}
}

// MARK: - Structs cannot be inherited.

struct Item {
	var title: String
}

struct AnotherItem: Item {
	
}

// MARK: - Classes can be a visual component.

class HomeViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .red
	}
}

// MARK: - Structs can represent data models.

struct User: Codable {
	let fullName: String
	let username: String
	let phone: String
	let photo: URL?
}

let users = try? JSONDecoder().decode([User].self, from: data)
