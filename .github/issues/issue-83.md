---
code: null
id: I_kwDOC16TM85gWbre
databaseId: 1616493278
number: 83
url: https://github.com/octomation/go-module/issues/83
title: "ci/cd: docs: configure environment"
issueType: null
labels:
  - "type: improvement"
  - "scope: docs"
  - "scope: inventory"
  - "impact: medium"
  - "effort: medium"
assignees:
  - kamilsk
milestone: "[[milestone-1]]"
parent: null
issueFields: {}
state: CLOSED
stateReason: COMPLETED
duplicateOf: null
createdAt: 2023-03-09T06:14:50Z
updatedAt: 2023-03-12T15:34:48Z
lastEditedAt: 2023-03-11T07:45:35Z
closedAt: 2023-03-12T15:34:47Z
---

# ci/cd: docs: configure environment

**Motivation:** provide a static site with documentation for better project representation.

**Inventory**

- https://docusaurus.io (too complex)
  - https://github.com/facebook/docusaurus
- https://mdxjs.com
  - https://github.com/mdx-js/mdx
  - https://github.com/mdx-js/awesome
- https://www.docz.site
  - https://github.com/doczjs/docz
- https://markdoc.dev
  - https://github.com/markdoc/markdoc
- https://nextjs.org (has benefits with integration with Vercel)
  - https://github.com/vercel/next.js/tree/canary/packages/next-mdx
  - https://tailwindui.com/templates/syntax
- Environment
  - https://github.com/octomation/go-module/settings/pages
  - https://vercel.com/dashboard

<!-- 2023-03-12T15:10Z https://github.com/octomation/go-module/issues/83#issuecomment-1465223920
```
#  "scripts": {
#    "docz:dev": "docz dev",
#    "docz:build": "docz build",
#    "docz:serve": "docz build && docz serve"
#  },
# /go-module/docs/node_modules/.bin/gatsby
```
-->

<!-- 2023-03-12T15:10Z https://github.com/octomation/go-module/issues/83#issuecomment-1465223993
```
#  "scripts": {
#    "docusaurus": "docusaurus",
#    "start": "docusaurus start",
#    "build": "docusaurus build",
#    "swizzle": "docusaurus swizzle",
#    "deploy": "docusaurus deploy",
#    "clear": "docusaurus clear",
#    "serve": "docusaurus serve",
#    "write-translations": "docusaurus write-translations",
#    "write-heading-ids": "docusaurus write-heading-ids",
#    "typecheck": "tsc"
#  },
```
-->

<!-- 2023-03-12T15:10Z https://github.com/octomation/go-module/issues/83#issuecomment-1465224054
```
#  "scripts": {
#    "dev": "next dev",
#    "build": "next build",
#    "start": "next start",
#    "lint": "next lint"
#  },
```
-->
