module.exports = {
  configureWebpack: (conf) => {
    conf.entry['app'].push(require.resolve(`webpack-dev-server/client`) + '?http://0.0.0.0:8080')
  },
  devServer: {
    host: '0.0.0.0',
    port: 8080,
    disableHostCheck: true
  }
}