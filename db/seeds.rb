# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(id: "00000000-0000-4000-A000-000000000001", address: "mfukWBPq8AUj7qTPVEXzn56dkkQansaYiP", balance: 100_000)
u2 = User.create(id: "00000000-0000-4000-A000-000000000002", balance: 0)
u3 = User.create(id: "00000000-0000-4000-A000-000000000003", address: "myoH54heY88dJqNwsKU2BdvSB4gACEa6fP", balance: 100_000)

t1 = Task.create(title: "Dog or Cat", task_type: Task::TYPE_MULTIPLE_CHOICE, choices: ['Dog', 'Cat'], cost: 100, address: "mtJYrjANCpiie7ZtWqhuj715B9x8kkBhv4", balance: 0, user: u1)
t2 = Task.create(title: "Hot or Not", task_type: Task::TYPE_MULTIPLE_CHOICE, choices: ['Hot', 'Not'], cost: 200, address: "mjWe4LQ8r6pXDJCN3gkEtusrNeUMo3guJz", balance: 0, user: u1)
t3 = Task.create(title: "What is your name?", task_type: Task::TYPE_FREE_FORM, cost: 200, address: "mgxPgtBe64X3fW6vXca78JavUczhT3pWvZ", balance: 0, user: u1)

a1 = Answer.create(task: t1, user: u2, choice: 0)
a2 = Answer.create(task: t1, user: u3, choice: 1)
a3 = Answer.create(task: t2, user: u2, choice: 0)
a4 = Answer.create(task: t3, user: u3, text: "Charlie")
