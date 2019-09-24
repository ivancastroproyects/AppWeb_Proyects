module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define('user', {
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    gender: DataTypes.STRING,
    birthday: DataTypes.DATEONLY
  })
  return User
}
