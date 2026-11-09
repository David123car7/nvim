-- C# / ASP.NET Core: Roslyn language server (the same one used by VS Code's C# Dev Kit)
return {
  {
    "seblyng/roslyn.nvim",
    ft = { "cs" },
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      broad_search = false, -- find the .sln/.csproj by walking up from the file
      lock_target = true,
    },
    config = function(_, opts)
      vim.lsp.config("roslyn", {
        settings = {
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
          },
          ["csharp|completion"] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
          },
        },
      })
      require("roslyn").setup(opts)
    end,
  },
}
