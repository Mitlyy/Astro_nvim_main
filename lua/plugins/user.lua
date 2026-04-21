local dashboard_header = [[
                               .....
                            .-*+##+++###*-
                          .*#+=:.      :=##.
                         -@@#++++++++*=-:+@-
                     :=+##+=-:......:-=*+#%+-.
                   =##+=::                .-+##*-
                  *@%#+###-                   :=##+:
          .=+++#+##+-:..                         .*##=:.-====.
        -##+-=#%+-                                  -+%@#=-=*##=.
      -#%=  =%*.                                      .*%*.   -+%+:
    .+%*  :##:                                          .*%*    .*%*.
   :%#:  -%+.:---.                                        -%#:    :#%
  .%#  :+@+:#@%=*#+.                                       .#%.     +
  -@+*#%@%:#@@%+:=@=   ..                   .-*-            =@#++*==#
   .=-:.%# *@@@@@@%::+#%+++:              :*#+*##*:        .#%:.:-==:
        *%= :*+++= :%@@#: #%.             +@:   :=+#+*===*+#+.
         -##-      -@@@@%#%%.             :@*      .:-=*=-:
           -##*:    :+%%%%*.    .          #%
             :*##*=:.......:-=+#@=         #%
                .-*+++####++**#@+.        +@-
                            =#+:        :##-
                          .%#.        =+#*
                          :@+     .-*#+-
                           -##*=++#+=.
                             :-=:.
]]

return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.indent = vim.tbl_deep_extend("force", opts.indent or {}, {
        scope = {
          enabled = false,
          filter = function() return false end,
          treesitter = { enabled = false },
        },
      })

      opts.scope = vim.tbl_deep_extend("force", opts.scope or {}, {
        enabled = false,
        filter = function() return false end,
        treesitter = { enabled = false },
      })

      opts.dashboard = vim.tbl_deep_extend("force", opts.dashboard or {}, {
        preset = {
          header = dashboard_header,
        },
      })
    end,
  },
}
