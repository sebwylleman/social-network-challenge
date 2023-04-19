require "user_account_repository.rb"
require "user_account.rb"
require "database_connection.rb"


def reset_user_account_table
  seed_sql = File.read('spec/seeds_social_network.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

RSpec.describe UserAccountRepository do
  before(:each) do 
    reset_user_account_table
  end

  it "returns all accounts" do
    repo = UserAccountRepository.new
    users = repo.all

    expect(users.length).to eq 1
    expect(users.first.email).to eq 'anon@gmail.com'
    expect(users.first.username).to eq'anon'
  end

  it "finds a single value from an attribute" do
    repo = UserAccountRepository.new
    user = repo.find(1)

    expect(user.email).to eq 'anon@gmail.com'
    expect(user.username).to eq 'anon'
  end

  it "adds a new user to the table" do
    repo = UserAccountRepository.new
    new_user = UserAccount.new
    new_user.email = 'tom@gmail.com'
    new_user.username = 'tom'
    repo.create(new_user)

    user_table = repo.all
    last_user = user_table.last

    expect(last_user.email).to eq 'tom@gmail.com'
    expect(last_user.username).to eq 'tom'
  end
  it "deletes first row from the table" do
    repo = UserAccountRepository.new
    repo.delete(1)

    users = repo.all
    expect(users.length).to eq 1
    expect(users[0].user_id).to eq '2'
  end
end
