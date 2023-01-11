class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :no_true_facts_title

    def no_true_facts_title
        if title == "True Facts"
            errors.add(:title, "True Facts as a title is clickbait")
        end
    end
end
