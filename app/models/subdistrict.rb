class Subdistrict < ActiveRecord::Base
  belongs_to :regency
  has_many :villages
end
