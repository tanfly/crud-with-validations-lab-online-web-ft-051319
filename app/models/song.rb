class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: :release_year, message: "This song already exists!"}
    validates :artist_name, presence: true
    validates :released, exclusion: { in: [nil] }
    validate :release_year_is_not_future_and_exists_if_released


    def release_year_is_not_future_and_exists_if_released    ## why couldn't I have these as two separate validations?
        if released && ( !release_year.present? || release_year > Date.current.year)
            errors.add(:release_year, "Please include a release year, must be the current year or earlier.")
        end
    end
end
