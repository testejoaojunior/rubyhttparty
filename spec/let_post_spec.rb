describe "post_let" do 
    context "when new user let" do

        let(:result) { ApiUser.save(build(:user).to_hash) }
        it { expect(result.response.code).to eql "200"}
    end

    context "when wrong email let" do
        let(:result) { ApiUser.save(build(:user).to_hash) }
        it ( expect(result.response.code).to eql "412")
        it ( expect(result.parsed_response["msg"]).to eql "Oops. You entered a wrong email")
    end

    context "when empty name let" do
        let(:result) { ApiUser.save(build(:user).to_hash) }

        it ( expect(result.response.code).to eql "412")
        it ( expect(result.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed")
    end

end