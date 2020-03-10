import React from "react";
import { create } from "react-test-renderer";
import Table from '../components/Table'

describe("Table component", () => {
  test("Table with currentSearchName == 'Ham'", () => {
    const component = create(<Table currentSearchName='Ham' />); 
    expect(component.toJSON()).toMatchSnapshot();
  }); 
  test("Table with currentSearchName == ''", () => {
    const component = create(<Table currentSearchName='' />); 
    expect(component.toJSON()).toMatchSnapshot();
  }); 
});