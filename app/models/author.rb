class Author < ActiveRecord::Base
  has_many :revisions
  validates_presence_of :name, :ip
  def to_param
    name
  end
  def self.find_or_create(name, ip)
    find_by_name_and_ip(name, ip) || create(:name => name, :ip => ip)
  end
end
