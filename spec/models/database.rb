class Database
    def initialize
        conn = {host: "http://localhost:15432", dbname: "nflix", user:"root@qaninja.io", password:"qaninja"}
        @connection = PG.connect(conn)
    end

    def delete_user(email)
        @connection.exec("DELETE from public.users where email = '#{email}';")
    end
end