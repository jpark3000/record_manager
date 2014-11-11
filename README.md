Record Manager
================

_Reverb Dev Challenge_

A simple CLI and API for parsing text files containing records in the following formats...

`LastName | FirstName | Gender | FavoriteColor | DateOfBirth`

`LastName, FirstName, Gender, FavoriteColor, DateOfBirth`

`LastName FirstName Gender FavoriteColor DateOfBirth`

## Getting Started

1. Clone Repo
	
	`git clone`

2. Install Dependencies	
	
	`bundle install`
	
3. Run Specs
	
	`rake spec`

4. Make CLI executable
	
	`chmod +x bin/cli`

## CLI Usage

#### Example

`bin/cli pipes.txt spaces.txt commas.txt -s gender`

#### Parsing and displaying a file

`bin/cli <path_to_file>`

This will display a list of records sorted by last name - the default sort.

#### Multiple Files

You can also input multiple files. Just seperate them with a space.

`bin/cli <path_to_file> <path_to_other_file> <another_file>`

#### Sort Options

`-s <sort_option>`

Available sort options: `gender`, `last_name`, `birthdate`

Adding the above flag and option will list the records sorted by `<sort_option>`

Providing the `-s` flag and no `<sort_option>` will also default to sorting by last name.

## API 

`rackup config.ru` to run locally

#### Endpoints

_Stock data is loaded before each request is made in order to demonstrate sorting implementation on `GET` routes._

`GET localhost:9292/records/gender` to return records sorted by gender.

`GET localhost:9292/records/birthdate` to return records sorted by date of birth.

`GET localhost:9292/records/name` to return records sorted by last name.
 
`POST localhost:9292/records` to create a record. `POST` data under the `record` param in one of three formats defined at the top of this readme.

__Examples__

`curl -d "record=Park | Justine | Female | blue | 12-11-987" localhost:9292/records`

or

`curl -H "Content-Type: application/json" -d '{"record":"Park, Justine, Female, Blue, 12-11-987"}' localhost:9292/records`


