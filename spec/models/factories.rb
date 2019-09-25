require_relative "user_model"
FactoryBot.define do

    factory :user, class: UserModel do
        full_name {"Chico Teste"}
        email {"chico@teste.com"}
        password {"teste123"}

        after(:build) do |user|
            Database.new.delete_user(user.email)
        end
    end

    factory :user_wrong_email, class: UserModel do
        full_name {"Chico Teste"}
        email {"chico#teste.com"}
        password {"teste123"}

    end


    factory :empty_name_user, class: UserModel do
        full_name {""}
        email {"chico#teste.com"}
        password {"teste123"}

    end



end
