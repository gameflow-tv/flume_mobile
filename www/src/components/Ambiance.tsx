import React, { useEffect } from 'react';
import { useTheme } from '@gameflow-tv/flume/dist/react';
import type { Theme } from '@gameflow-tv/flume';
import type { CSSProperties, FC, ReactNode } from 'react';
import { createContext, useContext } from 'react';
import { paletteFromHex } from '@gameflow-tv/ambiance';

interface AmbianceStyles extends CSSProperties {
  '--ambiance-current-color': string;
  '--ambiance-root-color': string;
  '--ambiance-bottom-color': string;
  '--ambiance-parent-color': string;
  '--ambiance-child-color': string;
  '--ambiance-dark': string;
  '--ambiance-medium-dark': string;
  '--ambiance-medium': string;
  '--ambiance-medium-light': string;
  '--ambiance-light': string;
}

export interface AmbianceProps {
  root: AmbianceProps;
  bottom: AmbianceProps;
  parent?: AmbianceProps;
  child?: AmbianceProps;
  color: string;
  elevation: number;
  source: string;
}

interface InternalAmbianceProps extends Omit<AmbianceProps, 'root' | 'bottom'> {
  root?: InternalAmbianceProps;
  bottom?: InternalAmbianceProps;
}

export interface AmbianceProviderProps {
  id?: string;
  elevation?: number;
  color?: string | null;
  children?: ReactNode;
  className?: string;
}

const AmbianceContext = createContext<AmbianceProps | undefined>(undefined);

const AmbianceConsumer = AmbianceContext.Consumer;

export const useAmbiance = (): AmbianceProps => {
  const ambiance = useContext(AmbianceContext);

  if (!ambiance) {
    throw new Error('Ambiance context is not defined');
  }

  return ambiance;
};

const Ambiance: FC<AmbianceProviderProps> = ({
  id,
  color,
  children,
  elevation,
  className,
}: AmbianceProviderProps) => {
  const parent = useContext(AmbianceContext);
  const theme = useTheme();
  const source = getSource(theme, parent, color);
  elevation = getElevation(elevation, parent);

  const tmp: InternalAmbianceProps = {
    bottom: undefined,
    root: undefined,
    parent,
    elevation,
    color: colorFromElevation(source, elevation),
    source,
  };

  const value: AmbianceProps = {
    ...tmp,
    root: getRootAmbiance(tmp),
    child: getChildAmbiance(tmp),
    bottom: getBottomAmbiance(tmp),
  };

  const styles: AmbianceStyles = {
    '--ambiance-current-color': value.color,
    '--ambiance-root-color': value.root.color,
    '--ambiance-bottom-color': value.bottom.color,
    '--ambiance-parent-color': value.parent?.color || value.color,
    '--ambiance-child-color': value.child?.color || value.color,
    '--ambiance-dark': colorFromElevation(source, 0),
    '--ambiance-medium-dark': colorFromElevation(source, 1),
    '--ambiance-medium': colorFromElevation(source, 2),
    '--ambiance-medium-light': colorFromElevation(source, 3),
    '--ambiance-light': colorFromElevation(source, 4),
  };

  const classes = ['ambiance'];
  if (className) {
    classes.push(className);
  }

  useEffect(() => {
    const palette = paletteFromHex(value.color);
    // Set .navbar background color
    const navbar = document.querySelector('.navbar');
    navbar?.setAttribute('style', `background-color: ${palette.mediumDark}`);

    const sidebar = document.querySelector('.navbar-sidebar');
    sidebar?.setAttribute('style', `background-color: ${palette.mediumDark}`);

    if (!sidebar) {
      // Listen to clicks on .navbar__toggle and check if the sidebar is open
      const toggle = document.querySelector('.navbar__toggle');
      toggle?.addEventListener('click', () => {
        // Wait a bit for the sidebar to open
        setTimeout(() => {
          const sidebar = document.querySelector('.navbar-sidebar');
          if (sidebar) {
            sidebar.setAttribute(
              'style',
              `background-color: ${palette.mediumDark}`
            );
          }
        }, 10);
      });
    }

    // Listen to
  }, [value.color]);

  return (
    <AmbianceContext.Provider value={value}>
      <div id={id} style={styles} className={classes.join(' ')}>
        {children}
      </div>
    </AmbianceContext.Provider>
  );
};

const getElevation = (elevation?: number, parent?: AmbianceProps): number => {
  if (parent && typeof elevation === 'undefined') {
    return parent.elevation + 1;
  }
  return 0;
};

const getSource = (
  theme: Theme,
  parent?: AmbianceProps,
  color?: string | null
): string => {
  if (parent && !color) {
    return parent.source;
  } else if (color) {
    return color;
  }
  return theme?.colors.secondary;
};

const getChildAmbiance = (
  a: InternalAmbianceProps
): AmbianceProps | undefined => {
  if (!a.child && a.elevation <= 4) {
    const child: InternalAmbianceProps = {
      bottom: a.bottom,
      root: a.root,
      elevation: a.elevation + 1,
      color: colorFromElevation(a.source, a.elevation + 1),
      parent: a as AmbianceProps,
      source: a.source,
    };

    child.child = getChildAmbiance(child);

    return child as AmbianceProps;
  }

  return;
};

const getBottomAmbiance = (a: InternalAmbianceProps): AmbianceProps => {
  if (!a.bottom && a.elevation <= 4) {
    const tmp: InternalAmbianceProps = {
      bottom: a,
      root: a.root,
      elevation: 4,
      color: colorFromElevation(a.source, 4),
      parent: a as AmbianceProps,
      source: a.source,
    };

    tmp.bottom = tmp;
    return tmp as AmbianceProps;
  }

  return a as AmbianceProps;
};

const getRootAmbiance = (a: InternalAmbianceProps): AmbianceProps => {
  if (!a.parent) {
    return a as AmbianceProps;
  }

  return getRootAmbiance(a.parent);
};

export const colorFromElevation = (color: string, elevation: number) => {
  const palette = paletteFromHex(color);

  switch (elevation) {
    case 0:
      return palette.dark;
    case 1:
      return palette.mediumDark;
    case 2:
      return palette.medium;
    case 3:
      return palette.mediumLight;
    case 4:
      return palette.light;
    default:
      return palette.light;
  }
};

export { Ambiance, AmbianceConsumer, AmbianceContext };
