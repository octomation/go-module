import * as React from 'react'
import {Helmet} from 'react-helmet-async'

const Wrapper = ({children, doc}) => <React.Fragment>
  <Helmet>
    <meta charSet="utf-8"/>
    <title>{doc.title}</title>
    <link href="https://raw.githubusercontent.com/octomation/.github/main/.static/octolab.png"
          rel="icon"
          type="image/png"
    />
  </Helmet>
  {children}
</React.Fragment>
export default Wrapper
