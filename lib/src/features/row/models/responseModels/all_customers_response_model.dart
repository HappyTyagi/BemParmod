// Model class representing a single customer entity.
class CustomersRM {
  // Unique identifier for the customer.
  String? id;

  // Full name of the customer.
  String? customerName;

  // Short name or abbreviation of the customer.
  String? shortName;

  // URL or path to the customer's logo.
  String? logo;

  // Identifier for the customer's product.
  String? customerProductId;

  // Constructor for creating an AllCustomersRM object.
  CustomersRM({
    this.id,
    this.customerName,
    this.shortName,
    this.logo,
    this.customerProductId,
  });

  // Factory method to create an AllCustomersRM object from a JSON map.
  factory CustomersRM.fromJson(Map<String, dynamic> json) {
    return CustomersRM(
      // Assigns the 'Id' key from JSON to the 'id' property.
      id: json['Id'],

      // Assigns 'CustomerName' key to 'customerName'.
      customerName: json['CustomerName'],

      // Assigns 'ShortName' key to 'shortName'.
      shortName: json['ShortName'],

      // Assigns 'Logo' key to 'logo'.
      logo: json['Logo'],

      // Assigns 'CustomerProductId' key to 'customerProductId'.
      customerProductId: json['CustomerProductId'],
    );
  }

  // Converts the AllCustomersRM object to a JSON map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    // Adds 'id' property to the JSON data.
    data['Id'] = id;

    // Adds 'customerName' property.
    data['CustomerName'] = customerName;

    // Adds 'shortName' property.
    data['ShortName'] = shortName;

    // Adds 'logo' property.
    data['Logo'] = logo;

    // Adds 'customerProductId' property.
    data['CustomerProductId'] = customerProductId;

    return data; // Returns the JSON data.
  }

  // Overrides toString() method to return a string representation of the object.
  @override
  String toString() {
    return 'CustomersRM {id: $id, customerName: $customerName, shortName: $shortName, logo: $logo, customerProductId: $customerProductId}';
  }
}
