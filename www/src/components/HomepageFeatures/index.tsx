import React from "react";

type FeatureItem = {
  title: string;
  image: string;
  description: JSX.Element;
};

const features: FeatureItem[] = [
  {
    title: "Pre-made components",
    image: "img/component.svg",
    description: (
      <>
        We provide a set of UI components that are ready to use out of the box.
        You can also extend or customize them to fit your needs.
      </>
    ),
  },
  {
    title: "Dynamic color palettes",
    image: "img/elevation.svg",
    description: (
      <>
        By using our built-in color system, you can easily create dynamic color
        palettes for your application, and even change them on the fly.
      </>
    ),
  },
  {
    title: "Consistent branding",
    image: "img/branding.svg",
    description: (
      <>
        Keep your branding consistent across your entire application with our
        built-in theming system.
      </>
    ),
  },
];

function Feature({ title, image, description }: FeatureItem) {
  return (
    <div className="flex flex-col gap-md">
      <div className="text--center">
        <img src={image} className="w-[200px] h-[200px]" role="img" />
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
    <section className="p-lg lg:p-2xl">
      <div className="flex flex-col md:flex-row justify-between gap-xl">
        {features.map((props, idx) => <Feature key={idx} {...props} />)}
      </div>
    </section>
  );
}
