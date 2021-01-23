class Concert < ApplicationRecord
    belongs_to :group
    validates :date, :place, :participants,  presence: true


    

end
