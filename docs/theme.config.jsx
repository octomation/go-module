export default {
  project: {
    link: 'https://github.com/octomation/go-module',
  },

  docsRepositoryBase: 'https://github.com/octomation/go-module/blob/main/docs',
  feedback: {
    useLink() {
      return 'https://github.com/octomation/go-module/discussions/new/choose'
    },
  },
  useNextSeoProps() {
    return {
      titleTemplate: '%s',
    }
  },

  head: (
    <>
      <meta charSet="utf-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <style>{`
        main p a img { display: inline; } /* badges */
      `}</style>
    </>
  ),
  logo: (
    <>
      <img width={24} height={24}
           src="https://raw.githubusercontent.com/octomation/.github/main/assets/geek/octolab.png"
           alt="OctoLab"
      />
      <span>Module</span>
    </>
  ),
  banner: {
    text: <a href="https://github.com/octomation/go-module/releases/tag/v1.0.0" target="_blank">
      🎉 Module v1.0.0 is released. Read more →
    </a>,
  },
  footer: {
    text: <span>
      MIT {new Date().getFullYear()} © <a href="https://github.com/octolab" target="_blank">OctoLab</a>.
    </span>,
  },
}
