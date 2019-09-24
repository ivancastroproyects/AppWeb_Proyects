const usersController = require('./controllers/users')
const managersController = require('./controllers/managers')

module.exports = (app) => {
  // user routes
  app.get('/users', usersController.index)
  app.post('/users', usersController.register)
  app.delete('/users', usersController.delete)
  app.post('/edit', usersController.edit)

  //pizzas routes
  app.get('/pizza', usersController.getstadistics)
  app.post('/pizza', usersController.editcount)

  // manager routes
  app.post('/register', managersController.register)
  app.post('/login', managersController.login)
}
