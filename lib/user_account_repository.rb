require_relative "./database_connection.rb"
require_relative "./user_account.rb"

class UserAccountRepository

  def all
    sql = 'SELECT * FROM user_account;'
    result = DatabaseConnection.exec_params(sql, [])
    answer = []
    result.each do |row|
      user_account = UserAccount.new
      user_account.email = row['email']
      user_account.username = row['username']
      answer << user_account
    end
    answer
  end
end