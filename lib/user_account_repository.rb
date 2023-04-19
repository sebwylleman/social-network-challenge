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

  def find(user_id)
    sql = 'SELECT * FROM user_account WHERE user_id = $1;'
    params = [user_id]

    result_set = DatabaseConnection.exec_params(sql, params)
    row1 = result_set[0]

    user_account = UserAccount.new
    user_account.email = row1["email"]
    user_account.username = row1["username"]

    return user_account
  end

  def create(user)
    sql = 'INSERT INTO user_account (email, username) VALUES($1, $2)'
    params = [user.email, user.username]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM user_account WHERE id = $1;'
    params = [id]
    DatabaseConnection.exec_params(sql, params)
  end
end