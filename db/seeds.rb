# frozen_string_literal: true

user1 = User.create(
  username: 'teste1',
  password: 'asdfgh',
  email: 'teste1@gmail.com',
  fake_username: '#1',
  bio: 'My cool fake bio'
)

user2 = User.create(
  username: 'teste2',
  password: 'asdfgh',
  email: 'teste2@gmail.com',
  fake_username: '#2',
  bio: 'My cool fake bio'
)
