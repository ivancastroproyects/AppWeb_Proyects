module.exports = (sequelize, DataTypes) => {
  const Manager = sequelize.define('manager', {
    username: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false
    }
  })
  return Manager
}
