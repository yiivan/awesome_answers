class Student < ActiveRecord::Base

  def self.find_user(search_term)
    where(["first_name ILIKE :term OR last_name ILIKE :term OR email ILIKE :term", {term: "#{search_term}"}])
  end

end
