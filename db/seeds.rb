# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

State.destroy_all
County.destroy_all
Person.destroy_all

states = {'ALABAMA': 'AL', 'ALASKA': 'AK', 'ARIZONA': 'AZ', 'ARKANSAS': 'AR',
  'CALIFORNIA': 'CA', 'COLORADO': 'CO', 'CONNECTICUT': 'CT', 'DELAWARE': 'DE',
  'FLORIDA': 'FL', 'GEORGIA': 'GA', 'HAWAII': 'HI', 'IDAHO': 'ID',
  'ILLINOIS': 'IL', 'INDIANA': 'IN', 'IOWA': 'IA', 'KANSAS': 'KS',
  'KENTUCKY': 'KY', 'LOUISIANA': 'LA', 'MAINE': 'ME', 'MARYLAND': 'MD',
  'MASSACHUSETTS': 'MA', 'MICHIGAN': 'MI', 'MINNESOTA': 'MN',
  'MISSISSIPPI': 'MS', 'MISSOURI': 'MO', 'MONTANA': 'MT', 'NEBRASKA': 'NE',
  'NEVADA': 'NV', 'NEW HAMPSHIRE': 'NH', 'NEW JERSEY': 'NJ', 'NEW MEXICO': 'NM',
  'NEW YORK': 'NY', 'NORTH CAROLINA': 'NC', 'NORTH DAKOTA': 'ND', 'OHIO': 'OH',
  'OKLAHOMA': 'OK', 'OREGON': 'OR', 'PENNSYLVANIA': 'PA', 'RHODE ISLAND': 'RI',
  'SOUTH CAROLINA': 'SC', 'SOUTH DAKOTA': 'SD', 'TENNESSEE': 'TN', 'TEXAS': 'TX',
  'UTAH': 'UT', 'VERMONT': 'VT', 'VIRGINIA': 'VA', 'WASHINGTON': 'WA',
  'WEST VIRGINIA': 'WV', 'WISCONSIN': 'WI', 'WYOMING': 'WY'}
activities = ['active', 'semi-active', 'neutral', 'semi-inactive', 'inactive']
i_activities = ['i_active', 'i_semi-active', 'i_neutral', 'i_semi-inactive', 'i_inactive']
gc_activities = ['gc_active', 'gc_semi-active', 'gc_neutral', 'gc_semi-inactive', 'gc_inactive']
e_activities = ['e_active', 'e_semi-active', 'e_neutral', 'e_semi-inactive', 'e_inactive']
states.each do |state, symbol|
  default = i_activities[rand(5)]
  State.create(name: state, symbol: symbol, activity: default, 
    immigration_activity: default, 
    gun_control_activity: gc_activities[rand(5)], 
    environment_activity: e_activities[rand(5)])
end

Person.create(name: "Barack Obama", sex: "Male", birthday: Date.parse("1961-11-04"),
              description: "Barack Hussein Obama II (born August 4, 1961) served as the 44th President of
              the United States from 2009 to 2017. The first African American to assume the presidency in U.S.
              history, he previously served in the U.S. Senate representing Illinois from 2005 to 2008 and in
              the Illinois State Senate from 1997 to 2004.",
              email: "bobama@gmail.com",
              phone_number:"1800-333-3333")


Rake::Task['sample_map:populate_ca'].invoke
Rake::Task['sample_map:populate_va'].invoke
