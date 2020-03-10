import React from "react";
import { create } from "react-test-renderer";
import TableToolbar from '../components/TableToolbar'

describe("TableToolbar component", () => {
  test("TableToolbar with numSelected > 0", () => {
    const component = create(<TableToolbar numSelected={1} />); 
    expect(component.toJSON()).toMatchSnapshot();
  });
  test("TableToolbar with numSelected == 0", () => {
    const component = create(<TableToolbar numSelected={0} />); 
    expect(component.toJSON()).toMatchSnapshot();
  });
});