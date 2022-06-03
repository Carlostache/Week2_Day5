
class Item

    def self.valid_date?(date)
        if date[0..3].to_i > 2050 || date[0..3].to_i < 1900
            return false
        elsif date[5..6].to_i > 12 || date[5..6].to_i < 1
            return false
        elsif date[8..9].to_i > 31 || date[8..9].to_i < 1
            return false
        end

        true
    end

    def initialize(title, deadline, description)
        raise "Invalid date entry" if Item.valid_date?(deadline) == false
        @title = title
        @deadline = deadline
        @description = description
    end

    def title
        @title
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        @deadline = new_deadline if Item.valid_date?(new_deadline) == true
    end

    def description
        @description
    end

    def description=(new_description)
        @description = new_description
    end

end