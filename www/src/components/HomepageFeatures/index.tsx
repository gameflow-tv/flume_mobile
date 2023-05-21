import React from 'react';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Pre-made components',
    Svg: require('@site/static/img/component.svg').default,
    description: (
      <>
        We provide a set of UI components that are ready to use out of the box.
        You can also extend or customize them to fit your needs.
      </>
    ),
  },
  {
    title: 'Dynamic color palettes',
    Svg: require('@site/static/img/ambiance.svg').default,
    description: (
      <>
        By using our built-in color system, you can easily create dynamic color
        palettes for your application, and even change them on the fly.
      </>
    ),
  },
  {
    title: 'Consistent branding',
    Svg: require('@site/static/img/branding.svg').default,
    description: (
      <>
        Keep your branding consistent across your entire application with our
        built-in theming system.
      </>
    ),
  },
];

function Feature({ title, Svg, description }: FeatureItem) {
  return (
    <div className="flex flex-col gap-md">
      <div className="text--center">
        <Svg className="w-[200px] h-[200px]" role="img" />
      </div>
      <div className="flex flex-col text-center gap-3xs">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className="xs:p-md md:p-lg lg:p-2xl">
      <div className="container">
        <div className="flex flex-row justify-between gap-xl">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
