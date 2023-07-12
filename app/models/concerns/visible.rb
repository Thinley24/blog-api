module Visible
    extend ActiveSupport::Concern #gives simpler way to add status validation to the concern

    # to add article and comment status using concerns
    VALID_STATUSES = ['public', 'private', 'archived']

    included do
        validates :status, inclusion: { in: VALID_STATUSES }
    end

    class_methods do #class to keep track of the public comments on main page
        def public_count
            where(status: 'public').count
        end
    end
    
    def archived?
        status == 'archived'
    end 
end