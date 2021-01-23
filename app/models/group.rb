class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy
    validates :name, :gender, presence: true
    has_many :crews, dependent: :destroy


    enum gender: [:male, :female, :band]
    def qconcerts
        self.concerts.count
    end

    def to_s
        name
    end

    def qcrews
        self.crews.count
    end

    def qparticipants
        self.concerts.pluck(:participants).sum
    end

    def qdebut
        if self.concerts.count > 0
            self.concerts.order(date: :asc).first.date
        else
            "no debut"
        end
    end

    def qmonth
        if self.concerts.count > 0
            self.concerts.where('extract(month from date) = ?', Time.now.month).count 
        else 
            return 0  
        end

    end  # agregar año 





end

