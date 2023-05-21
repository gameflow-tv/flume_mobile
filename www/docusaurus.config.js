// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const darkCodeTheme = require('./src/themes/dark');

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Flume',
  tagline: 'A Flutter implementation of the Flume design system by Gameflow',
  favicon: 'img/favicon.ico',
  url: 'https://flume.gameflow.dev',
  baseUrl: '/',

  // GitHub pages deployment config.
  organizationName: 'gameflow-tv',
  projectName: 'flume_mobile',

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },
  plugins: [
    async function plugin(_, __) {
      return {
        name: 'docusaurus-tailwindcss',
        configurePostCss(postcssOptions) {
          // Appends TailwindCSS and AutoPrefixer.
          postcssOptions.plugins.push(require('tailwindcss'));
          postcssOptions.plugins.push(require('autoprefixer'));
          return postcssOptions;
        },
      };
    },
  ],
  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl: 'https://github.com/gameflow-tv/flume_mobile/tree/main/www/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      colorMode: {
        defaultMode: 'dark',
        disableSwitch: true,
        respectPrefersColorScheme: false,
      },
      image: 'img/meta/open-graph.png',
      navbar: {
        title: 'Flume',
        logo: {
          alt: 'Flume Logo',
          src: 'img/logo.svg',
          width: 32,
          height: 32,
        },
        items: [
          {
            label: 'Overview',
            to: '/docs/overview',
          },
          {
            label: 'Getting started',
            to: '/docs/category/getting-started',
          },
          /*{
            label: 'Components',
            to: '/docs/category/components',
          },
          {
            label: 'Layouts',
            to: '/docs/category/layouts',
          },*/
          {
            label: 'Roadmap',
            to: '/docs/roadmap',
          },
          {
            to: 'https://github.com/gameflow-tv/flume_mobile',
            position: 'right',
            className: 'navbar-github-icon',
            'aria-label': 'GitHub repository',
          },
          {
            to: 'https://gameflow.tv?utm_source=flume&utm_medium=docs&utm_campaign=flume',
            position: 'right',
            className: 'navbar-gameflow-icon',
            'aria-label': 'Gameflow',
          },
        ],
      },
      footer: {
        links: [
          {
            title: 'Docs',
            items: [
              {
                label: 'Overview',
                to: '/docs/overview',
              },
              {
                label: 'Getting started',
                to: '/docs/category/getting-started',
              },
              /*
              {
                label: 'Components',
                to: '/docs/category/components',
              },
              {
                label: 'Layouts',
                to: '/docs/category/advanced',
              },
              */
              {
                label: 'Roadmap',
                to: '/docs/roadmap',
              },
            ],
          },
          {
            title: 'Resources',
            items: [
              {
                label: 'Blog Post (coming soon)',
                href: 'https://medium.com/@arnemolland?utm_source=flume&utm_medium=docs&utm_campaign=flume_blog',
              },
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'Open an Issue',
                href: 'https://github.com/gameflow-tv/flume_mobile/issues/new/choose',
              },
              {
                label: 'GitHub',
                href: 'https://github.com/gameflow-tv/flume_mobile',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Gameflow.<br/>Built with ☕️ by <a target="_blank" rel="noopener" aria-label="Gameflow" href="https://gameflow.tv">Gameflow</a>.`,
      },
      prism: {
        additionalLanguages: ['dart', 'bash', 'yaml'],
        theme: darkCodeTheme,
      },
    }),
};

module.exports = config;
