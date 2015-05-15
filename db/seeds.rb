# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(id: "00000000-0000-4000-A000-000000000001", address: "mqLYyJQvHHJpTmv2AbY8V7M5bpXhM2wczT", balance: 100_000)
u2 = User.create(id: "00000000-0000-4000-A000-000000000002", balance: 0)
u3 = User.create(id: "00000000-0000-4000-A000-000000000003", address: "mgEtzLbHeuE7QDS89r7bJdoFLuFoAfj2Dz", balance: 100_000)

t1 = Task.create(title: "Dog or Cat", task_type: Task::TYPE_MULTIPLE_CHOICE, choices: ['Dog', 'Cat'], cost: 100, address: "moAxDkv96UfjsuqYGs5SETtSCrUR1uAGVu", active: true, balance: 1000, user: u1)
t2 = Task.create(title: "Hot or Not", task_type: Task::TYPE_MULTIPLE_CHOICE, choices: ['Hot', 'Not'], cost: 200, address: "mmcbU36FhNw8EbyqgzgSDqFhhGqdygPiKk", active: true, balance: 10000, user: u1)
t3 = Task.create(title: "What is your name?", task_type: Task::TYPE_FREE_FORM, cost: 200, address: "n4auv2LcAtMxWa7KBe5VKXnn5CrjHmJhwU", balance: 0, user: u1)

a1 = Answer.create(task: t1, user: u2, choice: 0)
a2 = Answer.create(task: t1, user: u3, choice: 1)
a3 = Answer.create(task: t2, user: u2, choice: 0)
a4 = Answer.create(task: t3, user: u3, text: "Charlie")
