return {
  "seblj/roslyn.nvim",
  ft = "cs",
  opts = {
    config = {
      settings = {
        ["csharp|inlay_hints"] = {
          csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|completion"] = {
          dotnet_show_completion_items_from_unimported_namespaces = true,
        },
      },
    },
  },
}
