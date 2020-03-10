import React from "react";
import { create } from "react-test-renderer";
import TableHeader from '../components/TableHeader'

describe("TableHeader component", () => {
  test("TableHeader with Snapshot", () => {
    const component = create(<TableHeader onSelectAllClick={() => { }} order={'asc'}
      orderBy='' numSelected={2} rowCount={10} rowsPerPage={5} onRequestSort={() => { }} />);
    expect(component.toJSON()).toMatchSnapshot();
  });
});