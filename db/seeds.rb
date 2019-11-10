User.create!(
  name: "sample",
  email: "sample@sample.com",
  password: "samplesample",
  password_confirmation: "samplesample"
)

User.create!(
  name: "mintia96",
  email: "wazap1121@gmail.com",
  password: "12345678",
  password_confirmation: "12345678"
)

User.create!(
  name: "testuser",
  email: "test1@gmail.com",
  password: "12345678",
  password_confirmation: "12345678"
)

Category.create!(
  name: "食費",
  color: "#ff8ab5",
  user_id: 0
)

Category.create!(
  name: "交通費",
  color: "#8ac1ff",
  user_id: 0
)

Category.create!(
  name: "趣味",
  color: "#8affbb",
  user_id: 0
)

Category.create!(
  name: "その他",
  color: "#d4d4d4",
  user_id: 0
)

Category.create!(
  name: "美容",
  color: "#fff878",
  user_id: 1
)

Category.create!(
  name: "ゲームセンター",
  color: "#ffc273",
  user_id: 1
)

Category.create!(
  name: "税金",
  color: "#c874fc",
  user_id: 2
)
