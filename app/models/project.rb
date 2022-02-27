class Project < ApplicationRecord
    has_many :task

    after_initialize :set_defaults
    validates_presence_of :title, :description

    scope :almost_completed, -> { where('percent_complete > 0.75') }

    def set_defaults
        self.percent_complete ||= 8.0
    end
end
