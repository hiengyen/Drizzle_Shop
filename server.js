require('dotenv').config()
const http = require('http')
const logger = require('./src/utils/logger.js')
const app = require('./src/app.js')
const server = http.createServer(app)

const PORT = process.env.PORT || 8000

server.listen(PORT, () => {
  logger.info(`App running on port ${PORT}`)
})
