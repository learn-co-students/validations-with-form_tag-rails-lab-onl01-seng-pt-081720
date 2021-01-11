class Author < ActiveRecord::Base
    validates :name, presence: true
    validates :email, uniqueness: true
    validate :phone_is_10_digits_long

    private

    def phone_is_10_digits_long
       
        if !self.phone_number.nil?
            
            # remove everything except numbers from the phone number field.
            clean_phone_number = self.phone_number.gsub(/[^0-9]/i, '')

            # if it's also exactly 10 digits long, then it's ok, else add errors
            if !(clean_phone_number.length == 10)
                if clean_phone_number.length < 10 
                    errors.add(:phone_number, "Phone number is too short")
                else
                    errors.add(:phone_number, "Phone number is too long")
                end
            end
        end
    end
end
