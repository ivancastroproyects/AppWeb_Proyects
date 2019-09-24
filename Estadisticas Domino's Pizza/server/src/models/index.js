// const path = require('path')
const Sequelize = require('sequelize')
const sequelize = new Sequelize('reg', 'cliente1', '1234', {
  dialect: 'mysql',
  host: 'localhost',
  port: 3306
})

const models = {
  User: sequelize.import('./user'),
  Manager: sequelize.import('./manager'),
  Pizza: sequelize.import('./pizza')
}

models.sequelize = sequelize
models.Sequelize = Sequelize

module.exports = models
