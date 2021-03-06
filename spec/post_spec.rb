describe "post" do 
    context "when new user" do
        before do
            @new_user = build(:user).to_hash
            result = ApiUser.save(@new_user)
            puts result
        end
        
        expect(result.response.code).to eql "200"
    end


    context "when wrong email" do
        before do
            @new_user = build(:user_wrong_email).to_hash
            @result = ApiUser.save(@new_user)
        end

        it ( expect(@result.response.code).to eql "412")
        it ( expect(@result.parsed_response["msg"]).to eql "Oops. You entered a wrong email")
    end

    context "when empty name" do
        before do
            @new_user = build(:empty_name_user).to_hash
            @result = ApiUser.save(@new_user)
        end

        it ( expect(@result.response.code).to eql "412")
        it ( expect(@result.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed")
    end
end