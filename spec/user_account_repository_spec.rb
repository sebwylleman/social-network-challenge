require_relative "../lib/user_account_repository.rb"
require_relative "../lib/user_account.rb"
require_relative "../lib/database_connection.rb"


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
    user_account = UserAccount.new
    repo = UserAccountRepository.new
    repo.all

    expect(user_account.length).to eq '1'
    expect(user_account.first.email).to eq 'anon@gmail.com'
    expect(user_account.first.username).to eq'anon'
  end
end
