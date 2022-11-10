const withNextra = require('nextra')({
  theme: 'nextra-theme-docs',
  themeConfig: 'theme.config.jsx',
})

if (process.env.TARGET === 'static') {
  module.exports = withNextra({
    output: 'export',
    distDir: '../docs',

    images: {
      unoptimized: true,
    },
  })
  return
}

module.exports = withNextra({})
