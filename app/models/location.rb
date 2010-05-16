class Location < ActiveRecord::Base
  acts_as_mappable :auto_geocode=>{:field=>:address, :error_message=>'Could not geocode address'}
  
  validates_presence_of :name, :address

end
