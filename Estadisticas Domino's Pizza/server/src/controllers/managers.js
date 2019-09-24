const {Manager} = require('../models')

module.exports = {
  async register (req, res) {
    try {
      //  write into db
      const manager = await Manager.create(req.body)
      const userJson = manager.toJSON()
      res.send({
        username: userJson.username
      })
    } catch (err) {
      res.status(400).send({
        err
      })
    }
  },
  async login (req, res) {
    const {username, password} = req.body
    try {
      const manager = await Manager.findOne({
        where: {
          username: username,
          password: password
        }
      })
      if (!manager || !password) {
        res.status(403).send({
          error: 'Account log in failed'
        })
      }
      res.send({
        message: 'success'
      })
    } catch (err) {
      res.status(500).send(err)
    }
  }
}
