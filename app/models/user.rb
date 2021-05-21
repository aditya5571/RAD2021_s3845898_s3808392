class User < ApplicationRecord

    has_secure_password
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}, if: :isNotTwitterAccount
    validates :password, format: { with: /[a-zA-Z0-9]{8,20}/, message:"must be 8-20 characters long"}, if: :isNotTwitterAccount



    def isNotTwitterAccount
        provider != "twitter"
    end
end


