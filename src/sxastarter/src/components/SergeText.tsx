import React from 'react';
import { Field, RichText as JssRichText } from '@sitecore-jss/sitecore-jss-nextjs';

interface Fields {
  Text: Field<string>;
}

export type SergeTextProps = {
  params: { [key: string]: string };
  fields: Fields;
};

export const Default = (props: SergeTextProps): JSX.Element => {
  const text = props.fields ? (
    <span>
      SERGE: <JssRichText field={props.fields.Text} />
    </span>
  ) : (
    <span className="is-empty-hint">Rich text</span>
  );
  const id = props.params.RenderingIdentifier;

  return (
    <div className={`component rich-text ${props?.params?.styles?.trimEnd()}`} id={id ? id : undefined}>
      <div className="component-content">
        SERGE: <span>{text}</span>
      </div>
    </div>
  );
};

export const MoreSerge = (props: SergeTextProps): JSX.Element => {
  const text = props.fields ? (
    <span>
      MORE SERGE 8: <JssRichText field={props.fields.Text} />
    </span>
  ) : (
    <span className="is-empty-hint">Rich text</span>
  );
  const id = props.params.RenderingIdentifier;

  return (
    <div className={`component rich-text ${props?.params?.styles?.trimEnd()}`} id={id ? id : undefined}>
      <div className="component-content">
        MORE SERGE: <span>{text}</span>
      </div>
    </div>
  );
};
