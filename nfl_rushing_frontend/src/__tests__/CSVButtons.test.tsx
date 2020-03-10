import React from "react";
import { create } from "react-test-renderer";
import CSVButtons from '../components/CSVButtons'

describe("CSVButtons component", () => {
  test("CSVButtons with Snapshot", () => {
    const component = create(<CSVButtons/>);
    expect(component.toJSON()).toMatchSnapshot();
  });
});