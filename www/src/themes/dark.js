var theme = {
  plain: {
    cursor: '#ff00ff',
    color: '#eeeeee',
    backgroundColor: '#36393b',
  },
  styles: [
    {
      types: ['comment', 'punctuation', 'string', 'prolog'],
      style: {
        color: '#8B949E',
      },
    },
    {
      types: ['namespace'],
      style: {
        opacity: 0.7,
      },
    },
    {
      types: ['string', 'attr-value'],
      style: {
        color: '#f4dfa2',
      },
    },
    {
      types: [
        'constant',
        'char',
        'function',
        'entity',
        'url',
        'symbol',
        'keyword',
        'atrule',
        'statement',
        'placeholder',
      ],
      style: {
        color: '#ffbf00',
      },
    },
    {
      types: ['hexcode', 'builtin', 'variable'],
      style: {
        color: '#79C0FF',
      },
    },
    {
      types: ['tag', 'property'],
      style: {
        color: '#7EE787',
      },
    },
    {
      types: ['regex'],
      style: {
        color: '#A5D6FF',
      },
    },
    {
      types: ['deleted'],
      style: {
        color: '#FFA198',
        backgroundColor: '#490202',
      },
    },
    {
      types: ['inserted'],
      style: {
        color: '#7EE787',
        backgroundColor: '#04260F',
      },
    },
    {
      types: ['changed'],
      style: {
        color: '#FFA657',
        backgroundColor: '#5A1E02',
      },
    },
  ],
};

module.exports = theme;
