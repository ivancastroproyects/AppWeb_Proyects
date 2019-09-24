const {User} = require('../models')

module.exports = {
  async register (req, res) {
    try {
      //  write into db
      const user = await User.create(req.body)
      const userJson = user.toJSON()
      res.send({
        name: userJson.name
      })
    } catch (err) {
      res.status(400).send({
        err
      })
    }
  },
  async index (req, res) {
    const users = await User.findAll()
    res.send({
      user: users
    })
  },
  async delete (req, res) {
    const username = req.query.name
    console.log(req.query)
    try {
      const user = await User.findOne({
        where: {
          name: username
        }
      })
      if (user) {
        user.destroy()
        res.send({
          message: 'success'
        })
      } else {
        res.status(404).send({
          message: 'user does not exist'
        })
      }
    } catch (e) {
      res.status(400)
      res.send({
        message: e
      })
    }
  },  
  async getstadistics (req, res) {
    const namecount = await Pizza.findAll()
    res.send({
      pizza_name: namecount.pizza_name,
      count: namecount.count
    })
  },
  async editcount (req, res) {
    //const username = req.query.name
    const user = await Pizza.update(req.body, 
      { where: {
      pizza_name: req.body.name
    }
  })
  .then(function(rowsUpdated) {
    res.json(rowsUpdated)
  })
  },
  async edit (req, res) {
    //const username = req.query.name
    const user = await User.update(req.body, 
      { where: {
      name: req.body.name
    }
  })
  .then(function(rowsUpdated) {
    res.json(rowsUpdated)
  })
  }
}
