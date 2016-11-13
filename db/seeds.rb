# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
                        {
                            email: 'test-user-00@mail.com',
                            name: 'test-user-00',
                            last_sign_in: DateTime.now,
                            role: 'member',
                            phone: '15102160807',
                            password: '123123'
                        },
                        {
                            email: 'test-user-01@mail.com',
                            name: 'test-user-01',
                            last_sign_in: DateTime.now,
                            role: 'member',
                            phone: '15102160809',
                            password: '123123'
                        }
                    ])
company_types = CompanyType.create ([
  {
    name: 'TourismOffice',
    description: '旅游局'
  },
  {
    name: 'GroupTravel',
    description: '组团'
  },
  {
    name: 'LocalCommunication',
    description: '当地对接'
  },
  {
    name: 'Other',
    description: '其他'
  },
  {
    name: 'Source',
    description: '资源'
  },
  {
    name: 'Club',
    description: '社团'
  },
  {
    name: 'BelowTheLineActivity',
    description: '线下活动'
  }
])
