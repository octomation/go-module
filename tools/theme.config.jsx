export default {
  project: {
    link: 'https://github.com/octomation/go-module',
  },

  docsRepositoryBase: 'https://github.com/octomation/go-module/blob/main/tools',
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
      <meta name="twitter:image:src"
            content="https://repository-images.githubusercontent.com/190747443/299e9ada-7893-4eba-8cc0-9a29d3c53b83"/>
      <meta name="twitter:site" content="@github"/>
      <meta name="twitter:card" content="summary_large_image"/>
      <meta name="twitter:title" content="🧩 Template for a typical module written on Go."/>
      <meta name="twitter:description" content="🧩 Template for a typical module written on Go."/>
      <meta property="og:image"
            content="https://repository-images.githubusercontent.com/190747443/299e9ada-7893-4eba-8cc0-9a29d3c53b83"/>
      <meta property="og:image:alt" content="🧩 Template for a typical module written on Go."/>
      <meta property="og:site_name" content="GitHub"/>
      <meta property="og:type" content="object"/>
      <meta property="og:title" content="🧩 Template for a typical module written on Go."/>
      <meta property="og:url" content="https://go-module.octolab.org"/>
      <meta property="og:description" content="🧩 Template for a typical module written on Go."/>
      <style>{`
        main p a img { display: inline; } /* badges */
      `}</style>
    </>
  ),
  logo: (
    <>
      <img width={24} height={24}
           src="https://raw.githubusercontent.com/octomation/.github/main/.static/octolab.png"
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
