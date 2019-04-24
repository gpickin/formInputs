# FormInputs



### Field Definitions

A field is defined as a bunch of key value pairs, including but not limited to:

* Name 
* Type 
* Label
* FieldDescription
* Length
* Required 
* DefaultValue
* Class

#### name 

_This is required_ - This is the database column name. 

#### type

This is not required, but defaults to `text` if no type is listed. The type is defined by the FormInputs module which is used to create the UI for the CRUD forms. 

Types currently include: boolean, checkbox, checkboxset, date, image, number, select and text.

https://github.com/gpickin/formInputs

#### label

This is the human readable name of the field, used in messages and prompts in the generated CRUD. 

#### fieldDescription 

This is an optional field to allow you to add more information in the UI surrounding this field. 

#### length

Optional field to define the length of a field. Used to restrict the user input in the generated UI.

#### required

Optional field to defined if a field is required. Used to do simple validation in the generated UI.

#### defaultValue 

This allows you to set the default value for a field.

#### class

This allows you to add additional classes to the generated UI for a field. Using `col-md-3` for example will allow this field to be shown in a column alongside other fields.

### Additional Field options

Specific field types have other options associated with them.

#### number 

Number fields make use of the HTML 5 number field. It allows a user to use up and down arrows to step the number up and down. You can also use these additional field properties

```
"min": 1,
"max": 50
```

#### checkboxset

The Checkbox Set is a collection of checkboxes, stored as a comma separated list. This field requires a set of options to display the set of checkboxes

The `id`s are stored in the comma separated list, the `name` is displayed as the checkbox label.

```
"options": [
	{
		"id"			: "Home Banner",
		"name"			: "Home Banner"
	},
	{
		"id"			: "Cruise Banner",
		"name"			: "Cruise Banner"
	}
]
```

#### select

Select requires a set of options, so you have the ability to use a UDF in the CFC itself, or even use an API call ( different on each environment even ) to get the data. 

```
"optionsUDF": "",
"optionsAddEmpty": true
"optionsApiUrl": "https://mydomain/api/fetch/v1/tourSuppliers",
"optionsApiUrlstaging": "https://stg-mydomain/api/fetch/v1/tourSuppliers",
"optionsApiUrldevelopment": "http://dev-mydomain:51789/api/fetch/v1/tourSuppliers",
"optionsApiDataPath": "data",
"optionsApiColumn": "Vendor_Code",
"optionsApiNameColumn": "Vendor_Name"
```

optionsUDF - A function within the CFC itself, that returns an array of structs with 2 keys, `id` and `name` 

optionsAddEmpty - This value allows you to add an EMPTY select item at the top of the list, so there is not an actual value selected by default. This is useful for adding new records, where you want the user to pick a value, not just get the first in the list.

optionsApiUrl - A full url to an API call that returns an array of structs with 2 keys, defaulting to `id` and `name` unless you override with the `optionsApiColumn` and `optionsApiNameColumn` fields.

optionApiUrl:EnvironmentName - This is a special environmentally specific url, so in different environments, you could call different API Urls. You can append the environment name after the `optionApiUrl`. If a specific branch API url is set, the select box will use this API Url, otherwise, it will default to the main API url.

optionsApiDataPath - This is an optional parameter to help specify where the options is in the API response. If the array is in the `data` element, setting this field to `data` will help the select box know how to retrieve the data. By default, the array is assumed in the root of the API Response.

optionsApiColumn - This value allows you to override the default name of the `id` field for the options array. By default this is `id` but this allows you to use the name of another field, like `Vendor_Code` for example.

optionsApiColumnName - This value allows you to override the default name of the `name` field for the options array. By default this is `name` but this allows you to use the name of another field, like `Vendor_Name` for example.

### Grouping Fields

Fields are output in the order they are added to the array. You can group them in the UI with 2 additional field options.

```
"group": "Common Fields",
"groupIntro": "These are all of the Common fields shared by all types of placements"
```

Every field in the group needs a matching `group`. The groupIntro is only needed on the first field from that group. 