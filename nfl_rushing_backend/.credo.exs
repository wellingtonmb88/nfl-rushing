%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/", "src/", "web/", "apps/"],
        excluded: []
      },
      checks: [
        {Credo.Check.Consistency.TabsOrSpaces},

        # For some checks, like AliasUsage, you can only customize the priority
        # Priority values are: `low, normal, high, higher`
        {Credo.Check.Design.AliasUsage,
        [priority: :low, if_nested_deeper_than: 3, if_called_more_often_than: 0]},

        # For others you can also set parameters
        {Credo.Check.Readability.MaxLineLength, priority: :low, max_length: 100},

        # You can also customize the exit_status of each check.
        # If you don't want TODO comments to cause `mix credo` to fail, just
        # set this value to 0 (zero).
        {Credo.Check.Design.TagTODO, exit_status: 2},

        # To deactivate a check:
        {Credo.Check.Design.TagFIXME, false},
        {Credo.Check.Readability.ModuleDoc, false},
        {Credo.Check.Readability.AliasOrder, false}
      ]
    }
  ]
}
