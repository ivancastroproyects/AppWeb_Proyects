module.exports = (sequelize, DataTypes) => {
  const Pizza = sequelize.define('pizza', {
      pizza_name: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      count: {
        type: DataTypes.INTEGER,
        allowNull: false
      }
    })
  return Pizza
}
