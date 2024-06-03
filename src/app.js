require('dotenv').config()
const express = require('express')
const morgan = require('morgan')
const helmet = require('helmet')
const cookieParser = require('cookie-parser')
const compression = require('compression')
const cors = require('cors')

const router = require('./routes/index')

const app = express()

//init middlewares
app.use(morgan('dev'))
app.use(helmet())
app.use(compression())
app.use(cors({ credentials: true }))
app.use(cookieParser())
app.use(express.json())

//init routes
app.use('/', router)

//init server
module.exports = app
