describe "cadastro" do

    it "novo usuario" do
        result = HTTParty.post(
            "http://localhost:3001/user",
            body: {
                "full_name": "Diegão do raxa",
                "email": "mete2@gol.com",
                "password": "123456"}.to_json,
            headers: {
                "Content-Type": "application/json",
            },    
        )
        puts result
        expect(result.response.code).to eql "200"
    end

    it "usuario já cadastrado" do
        result = HTTParty.post(
            "http://localhost:3001/user",
            body: {
                "full_name": "Diegão do raxa",
                "email": "mete2@gol.com",
                "password": "123456"}.to_json,
            headers: {
                "Content-Type": "application/json",
            },    
        )
        puts result
        expect(result.response.code).to eql "409"
    end
end