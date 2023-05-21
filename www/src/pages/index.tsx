import React from "react";
import useDocusaurusContext from "@docusaurus/useDocusaurusContext";
import Layout from "@theme/Layout";
import HomepageFeatures from "@site/src/components/HomepageFeatures";
import { Ambiance } from "../components/Ambiance";

function HomepageHeader() {
  return (
    <header>
      <Ambiance
        color="#3b4368"
        className="bg-ambiance-dark w-full h-fit flex flex-col justify-center items-center"
      >
        <HeroImage />
      </Ambiance>
    </header>
  );
}

function HeroImage() {
  return (
    <div id="gallery" className="w-full relative m-[0_auto] overflow-clip p-md">
      <div className="m-auto w-full flex flex-row items-center justify-center">
        <div className="absolute -left-[64px] w-[256px] md:-left-[64px] md:w-[360px] lg:-left-xl lg:w-[450px] xl:w-[550px] 2xl:w-[728px] top-[25%] opacity-20">
          <picture>
            <source media="(max-width: 479px)" srcSet="img/spacing.svg" />
            <source media="(min-width: 480px)" srcSet="img/spacing.svg" />
            <img
              src="img/spacing.svg"
              alt="Spacing illustration"
              width="728px"
            />
          </picture>
        </div>
        <div className="relative sm:pl-[128px] z-10 flex flex-col items-start justify-start w-[331px] sm:w-[768px]">
          <picture>
            <source media="(max-width: 479px)" srcSet="img/hero.svg" />
            <source media="(min-width: 480px)" srcSet="img/hero.svg" />
            <img
              src="img/hero_image_dark.svg"
              alt="Flume Hero"
              height="auto"
              width="768px"
            />
          </picture>
        </div>
        <div className="absolute -right-[326px] w-[450px] top-[50%] md:-right-2xl md:w-[360px] lg:-right-[112px] lg:w-[450px] lg:top-[35%] xl:w-[550px] xl:top-[20%] 2xl:w-[728px] opacity-20">
          <picture>
            <source media="(max-width: 479px)" srcSet="img/motion.svg" />
            <source media="(min-width: 0px)" srcSet="img/motion.svg" />
            <img src="img/motion.svg" alt="Motion illustration" width="728px" />
          </picture>
        </div>
      </div>
    </div>
  );
}

export default function Home(): JSX.Element {
  const { siteConfig } = useDocusaurusContext();
  return (
    <Layout
      title={`${siteConfig.title}`}
      description={`The official documentation site for Flume. ${siteConfig.tagline} Built by Gameflow.`}
    >
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}
