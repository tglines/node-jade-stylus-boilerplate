module.exports = (app) ->
  app.get '/', (req,res) ->
    res.local 'title', 'Boilerplate'
    res.render 'home'
