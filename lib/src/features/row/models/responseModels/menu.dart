// Represents a Menu item with its properties
class MenuRM {
  // Represents the Menu's ID
  String? menuId;

  // Represents the Menu's Name
  String? menuName;

  // Represents the Display Order of the Menu
  int? displayOrder;

  // Represents the Menu's Security
  String? menuSecurity;

  // Represents the Menu's Code
  String? menuCode;

  // Constructor for MenuRM class
  MenuRM({
    this.menuId,
    this.menuName,
    this.displayOrder,
    this.menuSecurity,
    this.menuCode,
  });

  // JSON deserialization constructor
  MenuRM.fromJson(Map<String, dynamic> json) {
    // Assigns Menu ID from JSON
    menuId = json['MenuId'];

    // Assigns Menu Name from JSON
    menuName = json['MenuName'];

    // Assigns Display Order from JSON
    displayOrder = json['DisplayOrder'];

    // Assigns Menu Security from JSON
    menuSecurity = json['MenuSecurity'];

    // Assigns Menu Code from JSON
    menuCode = json['MenuCode'];
  }

  // JSON serialization method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    // Converts Menu ID to JSON
    data['MenuId'] = menuId;

    // Converts Menu Name to JSON
    data['MenuName'] = menuName;

    // Converts Display Order to JSON
    data['DisplayOrder'] = displayOrder;

    // Converts Menu Security to JSON
    data['MenuSecurity'] = menuSecurity;

    // Converts Menu Code to JSON
    data['MenuCode'] = menuCode;

    return data;
  }

  // Override of the 'toString()' method
  @override
  String toString() {
    return 'MenuRM { MenuId: $menuId, MenuName: $menuName, DisplayOrder: $displayOrder, MenuSecurity: $menuSecurity, MenuCode: $menuCode }';
  }
}
