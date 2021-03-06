Genre.create!(
    [
        { name: '米飯類' },
        { name: '豆類' },
        { name: '野菜' },
        { name: '果実' },
        { name: '肉類' },
        { name: '卵' },
        { name: '魚' },
        { name: '貝' },
        { name: '水産動物' },
        { name: '海藻' },
        { name: '酪農製品' },
        { name: '調味料' },
        { name: '食用油' },
        { name: '飲料水' },
        { name: 'その他' }
    ]
)
User.create!(
    [
        { name: 'Test_User_1', password: ENV['TEST_USER_PASSWORD'] },
        { name: 'Test_User_2', password: ENV['TEST_USER_PASSWORD'] },
        { name: 'Test_User_3', password: ENV['TEST_USER_PASSWORD'] }
    ]
)
Admin.create!(
    email: "admin@example.com",
    password: ENV['ADMIN_PASSWORD']
)