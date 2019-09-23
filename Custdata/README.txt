Data dictionaries for the notional data in this directory.

These datasets are derived from the PUMS 2016 data set(see https://github.com/WinVector/PDSwR2/blob/master/PUMS/download/PUMSDataDict16.txt) for a description of the real data.

These dictionaries can be assumed to come from somewhere else as part of a project. Reading them and debugging them is part of the data scientist's job.



**Data dictionary, custdata.RDS**

custid: string
customer id (primary key)

sex: string
customer sex
  Female
  Male

is_employed: logical
employment status
  FALSE
  TRUE
  NA: not in workforce

income: numeric
customer income
  -000001..-019998 	Loss $1 to $19998 (Rounded components)
   0000000 		None
   0000001 		$1 or break even
   0000002..9999999 	$2 to $9999999 (Rounded & top-coded components)

marital_status: string
customer marital status
  Divorced/Separated
  Married
  Never married
  Widowed

health_ins: logical
customer health insurance coverage
  FALSE
  TRUE

housing_type: string
customer housing status
  Homeowner free and clear
  Homeowner with mortgage/loan
  Occupied with no rent
  Rented

recent_move: logical
has customer moved in the past year
  FALSE
  TRUE
  unknown

num_vehicles: numeric
number of vehicles in customer household
  0..5 Number of vehicles
  6    Six vehicles or more
  NA   Unknown

age: numeric
customer age in years
  0 Unknown
  1..150 declared age

state_of_res: string
customer state of residence
  51 possible values, including District of Columbia

gas_usage: numeric
customer monthly gas bill amount
	  NA 	    	unknown or not applicable
		001 	    Included in rent or in condo fee
		002 	    Included in electricity payment
		003 	    No charge or gas not used
		004..999 	$4 to $999 (Rounded and top-coded)





**Data dictionary, hhdata.RDS**

household_id: string
customer household id

customer_id: string
customer id (primary key)

age: numeric
customer age in years

income: numeric
customer income in dollars



**Data dictionary, median_income.RDS**

state_of_res: string
state of residence (primary key)
  51 possible values, including District of Columbia

median_income: numeric
median household income in dollars
  note: appears to be truncated at $40,000







