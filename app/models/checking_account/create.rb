module CheckingAccount
  class Create < ::Micro::Case
    attribute :user_id
    attribute :amount

    def call!
      byebug
    end
  end
end
