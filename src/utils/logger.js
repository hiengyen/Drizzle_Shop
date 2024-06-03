const pino = require('pino')
const dayjs = require('dayjs')

// Create a transport for pino-pretty
const transport = pino.transport({
  target: 'pino-pretty',
  options: {
    colorize: true,
  },
  //
})

// Configure the logger
const log = pino(
  {
    base: {
      pid: false,
    },
    timestamp: () => `,"time":"${dayjs().format()}"`,
  },
  transport,
)

module.exports = log
