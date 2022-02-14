require 'rails_helper'

RSpec.describe User do
  User.all.each(&:destroy)

  user =
    User.create(
      name: 'James Donald',
      username: 'jdonald',
      password: 'password'
    )
  it 'has a name' do
    name = user.name
    expect(name).to eq 'James Donald'
  end
  it 'has a username' do
    name = user.username
    expect(name).to eq 'jdonald'
  end

  it 'has a secure passsword' do
    password = user.passsword
    expect(password).to eq User.find_by_id(user.id).password_digest
  end
end
